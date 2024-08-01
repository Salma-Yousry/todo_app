import 'package:app_todo/app_color.dart';
import 'package:app_todo/home/settings/setting_tab.dart';
import 'package:app_todo/home/task_list/add_task_button_sheet.dart';
import 'package:app_todo/home/task_list/task_list_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String route_name = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int itemindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: Text('To Do List',style: Theme.of(context).textTheme.titleLarge,),
      // toolbarHeight: MediaQuery.of(context).size.height*0.14,
      ),
      bottomNavigationBar:BottomAppBar(
     shape: CircularNotchedRectangle(),
     notchMargin: 8,
     child: BottomNavigationBar(
        currentIndex: itemindex,
        onTap: (index){
          itemindex = index;
          setState(() {
          });
        },
        items: [
         BottomNavigationBarItem(icon: Icon(Icons.list,),
           label: '',
         ),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,),
            label:'',
          )

        ],
     ),
      ),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add,size: 33,),
        onPressed: () {
       showaddbuttonsheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            height:MediaQuery.of(context).size.height*0.09,
            width:double.infinity,
          ),
          //Expanded(child: tabs[itemindex]),
          ///بديل ال list
          Expanded(child: itemindex == 0 ? TaskListTab() : SettingTab()),
        ],
      ),

    );
  }

  void showaddbuttonsheet() {
    showModalBottomSheet(context: context,
        builder:(context) => AddTaskButtonSheet());
  }
// List<Widget> tabs = [TaskListTab(),SettingTab()];

}
