import 'package:app_todo/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
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
          Container(
            margin: EdgeInsets.all(9),
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.primaryColor,
            ),
            child: IconButton(onPressed: (){
            }, icon: Icon(Icons.check,size: 36,),color: AppColors.whiteColor,),
          )
        ],
      ),
    );
  }
}
