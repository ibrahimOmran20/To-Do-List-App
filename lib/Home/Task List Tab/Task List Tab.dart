import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/FireStore%20Utilies/Firebase%20Utilies.dart';
import 'package:to_do_app/Home/Task%20List%20Tab/TaskWidget.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:to_do_app/Model/Task.dart';
import 'package:to_do_app/My%20Theme.dart';
class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
if(provider.taskList.isEmpty){
  provider.getAllTaskCollectionFromFireStore();
}
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDay,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => {
              provider.getNewDateSelected(date)
            },
            leftMargin: 20,
            monthColor: MythemeData.colorBlack,
            dayColor: MythemeData.colorBlack,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MythemeData.lightPriamry,
            dotsColor: MythemeData.colorWhite,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskWidget(task: provider.taskList[index],);
              },
              itemCount: provider.taskList.length,
            ),
          )
        ],
      ),
    );
  }

}
