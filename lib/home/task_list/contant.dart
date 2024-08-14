import 'package:app_todo/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_color.dart';
import '../../model/task.dart';
import '../../firebase_utils.dart';
import '../../providers/listprovider.dart';


class contentTask extends StatefulWidget {
  Task task;

  contentTask({required this.task});

  @override
  _contentTaskState createState() => _contentTaskState();
}

class _contentTaskState extends State<contentTask> {
  var formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  void initState() {
    super.initState();
    title = widget.task.title ?? '';
    description = widget.task.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var listprovider = Provider.of<ListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List',style: Theme.of(context).textTheme.titleLarge,),
         toolbarHeight: MediaQuery.of(context).size.height*0.14,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*.7,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: title,
                  decoration: InputDecoration(labelText: 'This is Title'),
                  onChanged: (value) {
                    title = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: description,

                  decoration: InputDecoration(labelText: 'This is Description'),
                  onChanged: (value) {
                    description = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      await FireBaseUtils.updateTask(
                        widget.task.id,
                        title,
                        description,
                      );
                      listprovider.getAllTasksFromFireStore();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Save Changes'
                    ,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




