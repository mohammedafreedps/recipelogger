import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget cusButton({required String text, Function? function}) {
  return GestureDetector(
      onTap: () {
        if(function != null){
          function();
        }
      },
      child: Container(
        decoration: BoxDecoration(color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(20)),    
        width: 200,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyles.primaryNormal,
          ),
        ),
      ));
}
