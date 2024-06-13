import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget logOutButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: const Icon(
            Icons.logout,
            size: 40,
            color: Colors.white,
          )),
    ],
  );
}
