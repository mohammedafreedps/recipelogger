import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipelog/precentation/screens/widgets/text_field.dart';

Widget fillUpSignIn(
    {required TextEditingController name,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController comformPassword,
    required TextEditingController location}) {
  return Column(
    children: [
      textField(hintText: 'Name', controller: name),
      const SizedBox(
        height: 10,
      ),
      textField(hintText: 'Email', controller: email),
      const SizedBox(
        height: 10,
      ),
      textField(hintText: 'Password', obscure: true, controller: password),
      const SizedBox(
        height: 10,
      ),
      textField(
          hintText: 'Comform Password',
          obscure: true,
          controller: comformPassword),
      const SizedBox(
        height: 10,
      ),
      textField(hintText: 'Location', controller: location),
    ],
  );
}
