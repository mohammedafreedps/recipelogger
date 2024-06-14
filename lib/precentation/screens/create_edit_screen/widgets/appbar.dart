import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

PreferredSizeWidget apBar(){
  return AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: IconThemeData(color: AppColor.acsentColor),
      );
}