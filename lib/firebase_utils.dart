import 'package:app_todo/model/my_user.dart';
import 'package:app_todo/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class FireBaseUtils {
  ///لو مستخدم اكتر من method في نفس الجملة ال type هنقف عند اخر method فيهم
  //static CollectionReference<Task> getTaskCollection() {
  static CollectionReference<Task> getTaskCollection(String uId) {

      ///collection يا هتدور ع collection بتفس الاسم ترجعه يا هتعمل collection جديد بالاسم دا
     /// FirebaseFirestore.instance.collection(Task.collectionName).

    return  getUserCollection().doc(uId)
        .collection(Task.collectionName).
      ///withConverter بتدي نوع لل database بتخزن ايه
      withConverter<Task>
        (fromFirestore: (snapshot, options) =>
          Task.fromFireStore(snapshot.data()!),
          toFirestore: (task, options) => task.toFireStore());
  }

  //addTask
  static Future<void> addTaskToFireBase(Task task,String uId) {
    var taskCollectionRef = getTaskCollection(uId);

    ///Collection
    var taskDocRef = taskCollectionRef.doc();

    ///document
    task.id = taskDocRef.id;

    ///auto id
    return taskDocRef.set(task);

    //في حال مش عايزين ال id يكون auto
    ///DocumentReference<Task> taskDocRef = getTaskCollection().doc('12').set(task);
  }

  static Future<void> deleteTaskFromFireStore(String id,String uId) {
    return getTaskCollection(uId).doc(id).delete();
  }

  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance.collection(MyUser.collectionName).
    withConverter(
        fromFirestore: ((snapshot, options) =>
            MyUser.fromFireStore(snapshot.data())),
        toFirestore: (MyUser, options) => MyUser.toFireStore());
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFireBase(String uId) async {
    var querySnapshot = await getUserCollection().doc(uId).get();
    return querySnapshot.data();
  }
}
///firebase بتفهم حاجة اسمها json
///json طريقة  بفرمط بيها ال data
///ليه صورتين
///json object {}
///{} mab
///json array []