import 'package:to_do_app/Home/Task%20List%20Tab/TaskWidget.dart';
import 'package:to_do_app/generated/l10n.dart';

class Task {
  String id;
  String title;
  String description;
  int date;
  bool isChecked;

  Task({this.id = '', required this.title, required this.description,
    required this.date, this.isChecked = false});

  Task.fromJason(Map<String,dynamic> jason):this(
    id: jason['id'] as String,
    title:jason['title'] as String,
    description:jason['description'] as String,
    date:jason['dateTime'] as int,
    isChecked: jason['isChecked'] as bool,
  );


  Map<String, dynamic> toJson() {
    return {
      "id": id ,
      "title": title,
      "description": description ,
      "dateTime": date ,
      "isChecked": isChecked ,
    };
  }

}