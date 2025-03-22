import 'package:app_todo/home/task_list/task_list_item.dart';
import 'package:app_todo/providers/auth_user_provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../providers/app_config_provider.dart';
import '../../providers/listprovider.dart';

class TaskListTab extends StatefulWidget{
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {


  @override
  Widget build(BuildContext context) {
    var listprovider  = Provider.of<ListProvider>(context);
    var authprovider  = Provider.of<AuthUserProvider>(context);
    if(listprovider.taskList.isEmpty){
      listprovider.getAllTasksFromFireStore(authprovider.currentUser!.id!);
    }

    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: listprovider.selectDate,
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
            listprovider.changeSelectDate(selectedDate,authprovider.currentUser!.id!);
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
              return TaskListItem(task: listprovider.taskList[index],);
              //return TaskListItem();

            },
            itemCount: listprovider.taskList.length,
            //itemCount: 30,
          ),
        )
      ],
    );
  }


}