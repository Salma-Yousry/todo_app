
import 'dart:io';

import 'package:app_todo/home/home_screen.dart';
import 'package:app_todo/providers/app_config_provider.dart';
import 'package:app_todo/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDv0nZvTGFx8niDTWtHUxFVj7XlVLAZcuA',
        appId: 'com.example.app_todo',
        messagingSenderId: '158196967782',
        projectId: 'todo-app-b5330')
  )
      :
  await FirebaseFirestore.instance.disableNetwork();
  await Firebase.initializeApp();


 runApp(
      ChangeNotifierProvider(
          create:(context) => AppConfigProvider() ,
    child: MyApp()));
}
class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider  = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route_name,
      routes: {
   HomeScreen.route_name : (context)=>HomeScreen(),
      },
      theme: MyThemeData.LightTheme,
     // darkTheme: MyThemeData,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
