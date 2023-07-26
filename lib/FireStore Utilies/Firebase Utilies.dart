import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/Model/Task.dart';

 CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('Task').withConverter<Task>(
fromFirestore:((snapshot, options) =>Task.fromJason(snapshot.data()!)),
      toFirestore:(task, options) => task.toJson());
}

Future<void> addTaskToFireStore(Task task){
  var taskCollection = getTaskCollection();
  var docRef = taskCollection.doc();
  task.id = docRef.id;
   return docRef.set(task);
}

