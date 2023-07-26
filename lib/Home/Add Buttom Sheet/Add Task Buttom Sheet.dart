import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/FireStore%20Utilies/Firebase%20Utilies.dart';
import 'package:to_do_app/Model/Task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddTaskButtomSheet extends StatefulWidget {
  @override
  State<AddTaskButtomSheet> createState() => _AddTaskButtomSheetState();
}

class _AddTaskButtomSheetState extends State<AddTaskButtomSheet> {
  String title='';

  String description='';

  DateTime selectedDay=DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Add New Task',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Form(
            key:formKey ,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (text){
                  title=text;
          },
                decoration: InputDecoration(labelText: 'Enter Task Title'),
                validator: (text){
                  if(text==null || text.isEmpty){
                    return 'please enter task title';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (text){
                  description=text;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Task Description',
                ),
                validator: (text){
                  if(text==null || text.isEmpty){
                    return 'please enter Task Description';
                  }
                  return null;
                },
                maxLines: 4,
                minLines: 4,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Select Data',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  chosenDay();
                },
                child: Text(
                  '${formatDate(DateTime(selectedDay.year,selectedDay.month,selectedDay.day),
                      [dd, '-', mm, '-', yyyy])
                  }',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    addTask();
                  },
                  child: Text('Add',
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          ))
        ],
      ),
    );
  }

  void chosenDay() async {
    var chosenDay= await showDatePicker(
        context: context,
        initialDate: selectedDay,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDay!=null){
      selectedDay=chosenDay;
      setState(() {

      });

    }
  }

  void addTask() {
    if  (formKey.currentState?.validate()==true){
      Task task=Task(
          title: title,
          description: description,
          date: selectedDay.millisecondsSinceEpoch);

      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),
          onTimeout:(){
        provider.getAllTaskCollectionFromFireStore();
        Navigator.pop(context);
        print('object');
          } );
    }

  }
}
