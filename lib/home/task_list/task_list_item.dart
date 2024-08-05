import 'package:app_todo/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/task.dart';

class TaskListItem extends StatelessWidget {
  Task task;
 TaskListItem({required this.task});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        extentRatio: 0.25,
        // A motion is a widget used to control how the pane animates.
    motion: const ScrollMotion(),

    children: [
    // A SlidableAction can have an icon and/or a label.
    SlidableAction(
      borderRadius: BorderRadius.circular(15),
    onPressed:(context){

    },
    backgroundColor:AppColors.redColor,
    foregroundColor: AppColors.whiteColor,
    icon: Icons.delete ,
    label: 'Delete',

    ),

      ],
    ),
      child: Container(
        margin: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.whiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              color: AppColors.primaryColor,
              width: MediaQuery.of(context).size.height*0.009 ,
              height:MediaQuery.of(context).size.height*0.1 ,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title??'',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor
                  ),),
                  SizedBox(height: 10,),
                  Text(task.description??'',style:Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(9),
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.primaryColor,
              ),
              child: IconButton(onPressed: (){
              }, icon: Icon(Icons.check,size: 36,),color: AppColors.whiteColor,),
            ),

          ],
        ),
      ),
    );
  }
}
