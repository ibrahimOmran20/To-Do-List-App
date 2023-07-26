import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/Model/Task.dart';
import 'package:to_do_app/My%20Theme.dart';
import 'package:to_do_app/FireStore%20Utilies/Firebase%20Utilies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class TaskWidget extends StatefulWidget {
  Task task;
  TaskWidget({required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(startActionPane: ActionPane(
      extentRatio: .25,
      motion: const ScrollMotion(),
      
      children:  [
        SlidableAction(
          borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(20) ,
            topLeft: Radius.circular(20)
          ),
          onPressed: (context){
            provider.deleteTaskFromFireStore( widget.task).timeout(Duration(milliseconds: 500),
            onTimeout: (){
              provider.getAllTaskCollectionFromFireStore();
            });
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
      child: InkWell(onTap:(){

      } ,
        child: Container(
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
                      child: Text(widget.task.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:MythemeData.lightPriamry ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.task.description,
                        style: Theme.of(context).textTheme.displayMedium,),
                    )
                  ],
                ),
              ),
              InkWell(onTap: (){

              },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 21,vertical: 7),
                  decoration: BoxDecoration(
                    color: MythemeData.lightPriamry,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Icon(Icons.check,color: MythemeData.colorWhite,size: 35,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
