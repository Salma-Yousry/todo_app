import 'package:app_todo/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FireBaseUtils{
  ///لو مستخدم اكتر من method في نفس الجملة ال type هنقف عند اخر method فيهم
  static CollectionReference<Task> getTaskCollection(){
    return  ///collection يا هتدور ع collection بتفس الاسم ترجعه يا هتعمل collection جديد بالاسم دا
      FirebaseFirestore.instance.collection(Task.collectionName).
      ///withConverter بتدي نوع لل database بتخزن ايه
      withConverter<Task>
        (fromFirestore: (snapshot,options) => Task.fromFireStore(snapshot.data()!),
          toFirestore: (task,options)=> task.toFireStore());
  }
  //addTask
  static Future<void> addTaskToFireBase(Task task){
var taskCollectionRef = getTaskCollection(); ///Collection
  var taskDocRef = taskCollectionRef.doc(); ///document
   task.id =  taskDocRef.id; ///auto id
   return taskDocRef.set(task);

   //في حال مش عايزين ال id يكون auto
///DocumentReference<Task> taskDocRef = getTaskCollection().doc('12').set(task);
  }
  static Future<void> deleteTaskFromFireStore(String id){
return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTaskStatus(String taskId, bool isDone) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
      'isDone': isDone,
    });
  }
  static Future<void> updateTask(String taskId, String title, String description) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
        'title': title,
        'description': description,
      });

  }


}

///firebase بتفهم حاجة اسمها json
///json طريقة  بفرمط بيها ال data
///ليه صورتين
///json object {}
///{} mab
///json array []