import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil{
static void showLoading({required BuildContext context , required String messege}){
showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context){
return AlertDialog(
  content: Row(
    children:  [
     const CircularProgressIndicator(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(messege),
      )
    ],
  ),
);
    });
}
static void hideLoading(BuildContext context){
  Navigator.pop(context);
}
static void showMessege({required BuildContext context
  ,required String contant,String title='',String? posActionName,
  Function?posAction,String?negActionName,Function?negAction}){
  showDialog(context: context, builder: (context){
    List <Widget> actions = [];
    if(posActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
       // if(posAction!=null){
        //  posAction.call();
        //}
        posAction?.call();
      }, child: Text(posActionName)));
    }
    if(negActionName != null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      }, child: Text(negActionName)));
    }
return AlertDialog(
content:Text(contant),
  title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
  actions: actions,
);
  });
}
}