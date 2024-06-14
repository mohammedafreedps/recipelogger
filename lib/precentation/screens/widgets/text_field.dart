import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget textField({String? hintText, bool obscure = false,bool expands = false,TextEditingController? controller}) {
  return TextField(
    controller: controller,
    minLines: obscure ? 1 : null,
    maxLines: obscure ? 1 : null,
    expands: expands,
    obscureText: obscure,
    style: TextStyles.primaryNormal,
    cursorColor: AppColor.acsentColor,
    decoration: InputDecoration(
      hintStyle: TextStyles.primaryNormal,
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.acsentColor)
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.acsentColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
