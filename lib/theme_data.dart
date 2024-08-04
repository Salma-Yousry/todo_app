import 'package:app_todo/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  //data
  //light theme -- dark theme
  static final ThemeData LightTheme = ThemeData(
 primaryColor: AppColors.primaryColor,
   scaffoldBackgroundColor: AppColors.groundLightColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
  ),
    textTheme:TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.gray3Color,
      ),
      titleSmall:GoogleFonts.inder(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.gray7Color,
      ),
      bodyLarge: GoogleFonts.inder(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.gray3Color,
      ),
      bodyMedium: GoogleFonts.inder(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.gray7Color,
      ),
      bodySmall: GoogleFonts.inder(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.redColor,
      ),

    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.grayColor,
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 40),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
       shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        side:BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        ) ,
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
     shape: StadiumBorder(
       side: BorderSide(
         color: AppColors.whiteColor,
         width: 4,
       )
     )
     /* shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(35),
        side:BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        ) ,
      )*/
    /*  shape:CircleBorder(
        side: BorderSide(
          width: 4,
          color: AppColors.whiteColor,
          style: BorderStyle.solid,
        ),
      ),*/

    ),

      );

}