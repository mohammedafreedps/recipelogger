import 'package:flutter/material.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget module({required String title, required String value}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.acsentColor),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyles.primaryBold,
        ),
        Text(
          value,
          style: TextStyles.primaryBold,
        ),
      ],
    ),
  );
}