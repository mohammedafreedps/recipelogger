import 'package:flutter/material.dart';
import 'package:recipelog/precentation/style_manager.dart';

ScaffoldFeatureController bottomSnakBar(
    {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColor.secondaryColor,
      content: Text(
        message,
        style: TextStyles.primaryBold,
      )));
}
