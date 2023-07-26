
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Home/Task%20List%20Tab/TaskWidget.dart';
import 'package:to_do_app/My%20Theme.dart';

class TaskDone extends TaskWidget {
  TaskDone({required super.task});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MythemeData.colorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 4,
            color: MythemeData.lightPriamry,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(task.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:MythemeData.colorGreen ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(task.description,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(color:MythemeData.colorGreen ),),
                )
              ],
            ),
          ),
          Container(

            child: Text('Done',style: TextStyle(
                fontSize: 24,color: MythemeData.colorGreen,fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
