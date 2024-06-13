import 'package:flutter/material.dart';

class AppColor{
  static const Color primaryColor = Color.fromARGB(255, 1, 32, 78);
  static const Color secondaryColor = Color.fromARGB(255, 238, 78, 78);
  static Color acsentColor = Colors.white;
  static Color fontColor = Colors.white;
}

class TextStyles{
  static TextStyle primaryNormal = TextStyle(color: AppColor.fontColor);
  static TextStyle primaryBold = TextStyle(color: AppColor.fontColor,fontWeight: FontWeight.bold);
}