import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/widgets/text_field.dart';

Widget fillUpLogIn({required TextEditingController email, required TextEditingController password}) {
  return Column(
    children: [
      textField(hintText: 'Email',controller: email),
      const SizedBox(height: 10,),
      textField(hintText: 'Password',obscure: true,controller: password),
    ],
  );
}
