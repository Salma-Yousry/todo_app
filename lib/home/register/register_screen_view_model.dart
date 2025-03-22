import 'package:app_todo/home/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreenViewModel extends ChangeNotifier {
 late RegisterNavigator navigator;
  //hold data - handel logic
  void register(String email , String password) async {
    //todo: showLoading
   navigator.showMyLoading('Loading.....');
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /*MyUser myUser = MyUser(id: credential.user?.uid??'',
          name: ,
          email: );
      var authProvider = Provider.of<AuthUserProvider>(context,listen: false);
      authProvider.updateUser(myUser);
      //في ال build كل لما ال dataبتتغير عند الprovider بترسم ui جديد
      //لكن في register مش محتاجين نغير في ui فهنخلي ال listen ب false

      await FireBaseUtils.addUserToFireStore(myUser);*/

      //todo: hideLoading
      navigator.hideMyLoading();
      //todo: showMessage
      navigator.showMyMessage('Register Sccessfully.');
      print(credential.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
    //todo: hideLoading
    navigator.hideMyLoading();
    //todo: showMessage
    navigator.showMyMessage('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        //todo: hideLoading
        navigator.hideMyLoading();
        //todo: showMessage
        navigator.showMyMessage('The account already exists for that email.');
      }
      else if (e.code == 'network-request-failed') {
        //todo: hideLoading
        navigator.hideMyLoading();
        //todo: showMessage
        navigator.showMyMessage('A network error (such as timeout, interrupted connection or unreachable host) has occurred.');

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
