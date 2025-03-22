import 'package:app_todo/app_color.dart';
import 'package:app_todo/dialog_until.dart';
import 'package:app_todo/home/register/register_navigator.dart';
import 'package:app_todo/home/register/register_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Custom_Text_Form_Field.dart';

class RegisterScreen extends StatefulWidget {
  static const String route_name = 'Register_Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator {

  TextEditingController nameController = TextEditingController(text: 'Salma');

  TextEditingController emailController = TextEditingController(
      text: 'Salma@gmail.com');

  TextEditingController passwordController = TextEditingController(
      text: '123456');

  TextEditingController ConfarmPasswordController = TextEditingController(
      text: '123456');

  var formkey = GlobalKey<FormState>();
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Container(
            color: AppColors.groundLightColor,
            child: Image.asset('assets/images/background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill
            ),

          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Create Account', style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge),
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .23,),
                    CustomTextFormField(
                      label: 'User Name', controlar: nameController
                      , validator: (text) {
                      if (text == null || text
                          .trim()
                          .isEmpty) {
                        return 'Please enter User Name.';
                      }
                      return null;
                    },),
                    CustomTextFormField(label: 'Email'
                      ,
                      controlar: emailController,
                      Keyboardtype: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text
                            .trim()
                            .isEmpty) {
                          return 'Please enter Email.';
                        }

                        final bool emailValid =
                        RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter valid Email.';
                        }
                        return null;
                      },),
                    CustomTextFormField(label: 'Password',
                        controlar: passwordController
                        ,
                        obscureText: true,
                        Keyboardtype: TextInputType.number,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'Please enter Password.';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 chars.';
                          }
                          return null;
                        }),
                    CustomTextFormField(label: 'Confirm Password'
                        ,
                        obscureText: true,
                        controlar: ConfarmPasswordController,
                        Keyboardtype: TextInputType.phone,
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'Please enter Confirm Password.';
                          }
                          if (text != passwordController.text) {
                            return "Confirm Password doesn't match Password.";
                          }
                          return null;
                        }),

                    Padding(
                        padding: EdgeInsets.all(8),
                        child: ElevatedButton(onPressed: () {
                          register(context);
                        }, child: Text('Create Account', style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                          fontSize: 21,
                        ),)))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void register(BuildContext context) async {
    if (formkey.currentState?.validate() == true) {
      viewModel.register(emailController.text, passwordController.text);
    }
  }

  @override
  void hideMyLoading() {
    DialogUtil.hideLoading(context);
  }

  @override
  void showMyLoading(String message) {
    DialogUtil.showLoading(context:context,messege: message);
  }

  @override
  void showMyMessage(String message) {
  DialogUtil.showMessege(context: context, contant: message,posActionName: 'ok');
  }
}

