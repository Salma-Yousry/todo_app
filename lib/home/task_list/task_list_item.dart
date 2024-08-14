import 'package:app_todo/app_color.dart';
import 'package:app_todo/firebase_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../model/task.dart';
import '../../providers/listprovider.dart';
import 'contant.dart';

class TaskListItem extends StatelessWidget {

  Task task;
  TaskListItem({required this.task});
  @override
  Widget build(BuildContext context) {
    var listprovider  = Provider.of<ListProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),

        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed:(context) {
//delete task
              FireBaseUtils.deleteTaskFromFireStore(task.id)
                  .then((value) {
                print('Task Deleted Successfully');
                listprovider.getAllTasksFromFireStore();
              })
                  .timeout(Duration(milliseconds: 500), onTimeout: () {
                print('Task Deleted Successfully');
                listprovider.getAllTasksFromFireStore();
              });
            },
            backgroundColor:AppColors.redColor,
            foregroundColor: AppColors.whiteColor,
            icon: Icons.delete ,
            label: 'Delete',

          ),

        ],
      ),
        child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => contentTask(task: task),
            ),

          );

        },


      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(9),
              color: task.isDone ? AppColors.greenColor : AppColors.primaryColor,
              width: MediaQuery.of(context).size.height*0.009 ,
              height:MediaQuery.of(context).size.height*0.1 ,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6,),
                  Text(task.title??'',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: task.isDone ? AppColors.greenColor : AppColors.primaryColor,
                  ),),
                  SizedBox(height: 6,),
                  Text(task.description??'',style:Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(9),
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: task.isDone ? AppColors.whiteColor : AppColors.primaryColor,
              ),


              child: GestureDetector(
                onTap: () {
                  task.isDone = !task.isDone;
                  FireBaseUtils.updateTaskStatus(task.id, task.isDone);
                  listprovider.getAllTasksFromFireStore();
                },
                child: GestureDetector(
                  onTap: () {
                    // Update task status
                    task.isDone = !task.isDone;
                    FireBaseUtils.updateTaskStatus(task.id, task.isDone);
                    listprovider.getAllTasksFromFireStore();
                  },
                  child: task.isDone
                      ? Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        'Done!',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 20,
                            color: AppColors.greenColor
                        )
                    ),
                  )
                      : Icon(
                    Icons.check,
                    size: 36,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),





    ),

          ],
        ),
        ),
    ),

    );

  }
}