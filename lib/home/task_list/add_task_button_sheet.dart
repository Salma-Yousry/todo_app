import 'package:app_todo/app_color.dart';
import 'package:app_todo/firebase_utils.dart';
import 'package:app_todo/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/listprovider.dart';

class AddTaskButtonSheet extends StatefulWidget {


  @override
  State<AddTaskButtonSheet> createState() => _AddTaskButtonSheetState();
}

class _AddTaskButtonSheetState extends State<AddTaskButtonSheet> {
  //step calander
  var selectdate = DateTime.now();
  var formkay = GlobalKey<FormState>();

//data of textFromField
  String title = '';
  String description= '';
 late ListProvider listprovider;
  @override
  Widget build(BuildContext context) {
    listprovider  = Provider.of<ListProvider>(context);
//button sheet
    return Container(
      margin: EdgeInsets.all(15),
child: Column(
  children: [
    Text('Add new Task',style:Theme.of(context).textTheme.titleMedium,),
    Form(
        key: formkay,
        child:Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10,),
        TextFormField(

          onChanged: (text){
            title = text;
          },
          //Massage of error in textFromField
          validator: (text){
            if(text==null || text.isEmpty){
              return 'Please enter task title';
            }
            return null ;  //valid
          },

          decoration: InputDecoration(
           enabledBorder: UnderlineInputBorder(
             borderSide: BorderSide(color: AppColors.gray4Color)
           ),
            errorStyle: Theme.of(context).textTheme.bodySmall,
            hintText: "enter your task",
            hintStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(height: 15),
        TextFormField(
          onChanged: (text){
            description = text;
          },
          validator: (text){
            if(text==null || text.isEmpty){
              return 'Please enter task description';
            }
            return null ;  //valid
          },

          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray4Color)
            ),
            errorStyle: Theme.of(context).textTheme.bodySmall,
            hintText: "enter task description",
            hintStyle: Theme.of(context).textTheme.titleSmall,

          ),
          maxLines: 4,
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Select date',style:  Theme.of(context).textTheme.bodyLarge,),
        ),
       SizedBox(height: 5,),
        InkWell(
          onTap: (){
            showCalender();
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),

            child: Text('${selectdate.day}/${selectdate.month}/${selectdate.year}',
              style:  Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
          ),
        ),
        SizedBox(height: 5,),

      /*  ElevatedButton(onPressed: (){
          addtask();
        }, child: Text('Add')),*/

   IconButton(
          splashColor: AppColors.primaryColor,
          onPressed: (){
            addtask();
          }, icon: Icon(Icons.check,size: 37,)),

      ],
    )

    )
  ],
),
    );
  }

  void showCalender() async {
    var chosendate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    ///Date time    Date time?
       // selectdate=ch ?? selectdate;
    if(chosendate!=null){
      selectdate = chosendate;
    }
        setState(() {

        });
///anther
       // if(chosendate != null ){
        //  selectdate=chosendate;
       // }
  }

  void addtask() {
    if(formkay.currentState?.validate()==true){
      //add task
      print(selectdate);
      Task task = Task(title: title,
          description: description,
          dateTime: selectdate
       );
      FireBaseUtils.addTaskToFireBase(task).timeout(Duration(seconds: 1),
          onTimeout: (){
        print('Task added successfully');
        listprovider.getAllTasksFromFireStore();
        Navigator.pop(context);
          });
      print(task.dateTime);
    }
  }
}
