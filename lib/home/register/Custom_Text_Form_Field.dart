import 'package:app_todo/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef MyValidator = String?Function(String?);
class CustomTextFormField extends StatelessWidget {
String label;
//String? Function(String?)? validator;
MyValidator validator;
TextEditingController controlar;
TextInputType Keyboardtype;
bool obscureText;
CustomTextFormField({required this.label,required this.validator,
required this.controlar, this.Keyboardtype = TextInputType.text,this.obscureText=false});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          errorMaxLines: 2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            )
          ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide:BorderSide(
    color: AppColors.primaryColor,
    width: 2,
    )
    ),
            errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
          borderSide:BorderSide(
            color: AppColors.redColor,
            width: 2,
          )
      ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:BorderSide(
                color: AppColors.redColor,
                width: 2,
              ),
          ),
          labelText: label,

        ),
        validator: validator,
        controller: controlar,
keyboardType : Keyboardtype,
obscureText: obscureText,),
);}
}
