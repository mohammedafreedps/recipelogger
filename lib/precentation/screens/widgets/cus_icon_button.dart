import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget cusIconButton({required IconData icon}){
  return IconButton(onPressed: (){

  }, icon: Icon(icon,color: AppColor.acsentColor,));
}