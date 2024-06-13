import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/create_edit_screen.dart';
import 'package:recipelog/precentation/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

FloatingActionButton floatingButton({required BuildContext context}) {
  return FloatingActionButton(
    backgroundColor: AppColor.secondaryColor,
    onPressed: () {
      Navigators.pushNavigate(context: context, page: const CreateEditScreen());
    },
    child: Center(
      child: Icon(Icons.add,color: AppColor.acsentColor,),
    ),
  );
}
