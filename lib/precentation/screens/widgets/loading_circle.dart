import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget loadingCircle({Color color = AppColor.secondaryColor}){
  return  CircularProgressIndicator(color: color);
}