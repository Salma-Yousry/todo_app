import 'package:app_todo/home/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginScreenViewModel extends ChangeNotifier {
  //hold data - handel logic
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginNavigator navigator;
  var formkey = GlobalKey<FormState>();

  void login() async {
    if (formkey.currentState?.validate() == true) {
      //todo: showLoading
      navigator.showMyLoading('Waiting.....');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        /* var user = await FireBaseUtils.readUserFireBase(credential.user?.uid??'');
      if(user == null){
        return;
      }
      var authProvider = Provider.of<AuthUserProvider>(context,listen: false);
      authProvider.updateUser(user);*/
        //todo: hideLoading
        navigator.hideMyLoading();
        //todo: showMessage
        navigator.showMyMessage('Login Successfully');
        print(credential.user?.uid ?? '');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          //todo: hideLoading
          navigator.hideMyLoading();
          //todo: showMessage
          navigator.showMyMessage(
              'The supplied auth credential is incorrect, malformed or has expired.');
        } else if (e.code == 'network-request-failed') {
          //todo: hideLoading
          navigator.hideMyLoading();
          //todo: showMessage
          navigator.showMyMessage(
              'A network error (such as timeout, interrupted connection or unreachable host) has occurred.');
        }
      }
      catch (e) {
        //todo: hideLoading
        navigator.hideMyLoading();
        //todo: showMessage
        navigator.showMyMessage(e.toString());
      }
    }
  }
}
