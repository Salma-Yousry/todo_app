import 'package:app_todo/model/my_user.dart';
import 'package:flutter/cupertino.dart';

class AuthUserProvider extends ChangeNotifier{
  MyUser? currentUser;
  void updateUser (MyUser newUser){
    currentUser = newUser;
    notifyListeners();
  }
}