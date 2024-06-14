import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/alert_box.dart';

Widget logOutButton({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
          onPressed: () {
            alertBox(context: context, index: 0,isLogout: true);
          },
          icon: const Icon(
            Icons.logout,
            size: 40,
            color: Colors.white,
          )),
    ],
  );
}
