import 'package:app_todo/app_color.dart';
import 'package:app_todo/dialog_until.dart';
import 'package:app_todo/home/login/login_navigator.dart';
import 'package:app_todo/home/login/login_screen_view_model.dart';
import 'package:app_todo/home/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../register/Custom_Text_Form_Field.dart';



class LoginScreen extends StatefulWidget  {
  static const String route_name = 'Login_Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  LoginScreenViewModel viewModel = LoginScreenViewModel();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
  create: (context) => LoginScreenViewModel(),
  child: Stack(
  children: [
  Container(
  color: AppColors.groundLightColor,
  child:Image.asset('assets/images/background.png',
  width: double.infinity,
  height: double.infinity,
  fit:BoxFit.fill
  ),

  ),
  Scaffold(
  backgroundColor: Colors.transparent,
  appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  title: Text('Login',style: Theme.of(context).textTheme.titleLarge),
  backgroundColor: Colors.transparent,
  ),
  body: Form(
  key: viewModel.formkey,
  child: SingleChildScrollView(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
  SizedBox(height: MediaQuery.of(context).size.height*0.23,),
  Padding(
  padding: EdgeInsets.all(8),
  child: Text('Welcome Back!',style:Theme.of(context).textTheme.titleMedium?.copyWith(
  fontSize: 23
  ) ,),
  ),
  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
  CustomTextFormField(label: 'Email',controlar: viewModel.emailController,Keyboardtype: TextInputType.emailAddress,validator:(text){
  if(text==null || text.trim().isEmpty){
  return 'Please enter Email.';
  }

  final bool emailValid =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
  if(!emailValid){
  return 'Please enter valid Email.';
  }
  return null;
  },),
  CustomTextFormField(label: 'Password',controlar: viewModel.passwordController
  ,obscureText: true,Keyboardtype: TextInputType.number,validator:(text){
  if(text==null || text.trim().isEmpty){
  return 'Please enter Password.';
  }
  if(text.length<6){
  return 'Password should be at least 6 chars.';
  }
  return null;
  }),


  Padding(
  padding: EdgeInsets.all(8),
  child: ElevatedButton(onPressed: (){
  viewModel.login();
  }, child: Text('Login',style: Theme.of(context).textTheme.titleLarge?.copyWith(
  fontSize: 21,
  ),))),
  TextButton(onPressed: (){
  Navigator.of(context).pushNamed(RegisterScreen.route_name);
  }, child: Text('OR Create Account'))
  ],
  ),
  ),
  ),
  )
  ],
  ),
  );

  }

  @override
  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogUtil.hideLoading(context);
  }

  @override
  void showMyLoading(String message) {
    // TODO: implement showMyLoading
    DialogUtil.showLoading(context: context, messege: message);
  }

  @override
  void showMyMessage(String message) {
    // TODO: implement showMyMessage
    DialogUtil.showMessege(context: context, contant: message,posActionName: 'ok');
  }
}