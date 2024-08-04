
import 'package:app_todo/firebase_utils.dart';
import 'package:app_todo/home/task_list/task_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';

import '../../model/task.dart';

class TaskListTab extends StatefulWidget{
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  List<Task> tasklist =[];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
             // return TaskListItem(task: tasklist[index],);
              return TaskListItem();

            },
           // itemCount: tasklist.length,
            itemCount: 30,
          ),
        )
      ],
    );
  }

  /*void getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapshot= await FireBaseUtils.getTaskCollection().get();
    //List<QueryDocumentSnapshot<Task>>  => List <Task>
    tasklist = querySnapshot.docs.map((doc){
      return doc.data();
    }).toList();
    setState(() {

    });
  }*/
}