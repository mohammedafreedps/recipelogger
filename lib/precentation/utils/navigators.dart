import 'package:flutter/material.dart';

class Navigators{
  static void pushNavigate({required BuildContext context, required Widget page}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
  }
  static void pushReplaceNavigate({required BuildContext context, required Widget page}){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> page));
  }
  static void popNavigate({required BuildContext context}){
    Navigator.pop(context);
  }
}