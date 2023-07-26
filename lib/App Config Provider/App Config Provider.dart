
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/FireStore%20Utilies/Firebase%20Utilies.dart';
import 'package:to_do_app/Home/Add%20Buttom%20Sheet/Add%20Task%20Buttom%20Sheet.dart';
import 'package:to_do_app/Home/TaskDone.dart';
import 'package:to_do_app/Model/Task.dart';

class AppConfigProvider extends ChangeNotifier {
  List<Task> taskList=[];
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  DateTime selectedDay=DateTime.now();

  void changeLanguage(String newLanguage) {
    if (newLanguage == appLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == appTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  void getAllTaskCollectionFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList=taskList.where((task) {
      DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDay.day == taskDate.day && selectedDay.month == taskDate.month
          && selectedDay.year == taskDate.year) {
        return true;
      }
    return false;
    }).toList();

    taskList.sort((Task task1, Task task2){
      DateTime dateTime1=DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2=DateTime.fromMillisecondsSinceEpoch(task2.date);
     return dateTime1.compareTo(dateTime2);

    });

    notifyListeners();
  }

  void getNewDateSelected(DateTime newDate){
    selectedDay=newDate;
getAllTaskCollectionFromFireStore();
  }

  Future<void> deleteTaskFromFireStore(Task task){

    return getTaskCollection().doc(task.id).delete();
  }

  updateTaskFromFireStore(Task task){
    return getTaskCollection().doc(task.id).update({

    });
        }
  updateIsCheckedFromFireStore(Task task){
    return getTaskCollection().doc(task.id).update({
     "isChecked": TaskDone(task: task,)
    });
        }


  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

}