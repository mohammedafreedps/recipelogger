import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/appbar.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/fill_in_create.dart';
import 'package:recipelog/precentation/screens/widgets/cus_button.dart';
import 'package:recipelog/precentation/style_manager.dart';

class CreateEditScreen extends StatelessWidget {
  final bool isEdit;
  const CreateEditScreen({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apBar(),
      backgroundColor: AppColor.primaryColor,
      body: Padding(padding: const EdgeInsets.all(20),child: Column(
        children: [
          Text(isEdit ? 'Edit' : 'Create',style: TextStyles.primaryBold.copyWith(fontSize: 30),),
          Expanded(child: fillInCreate()),
          const SizedBox(height: 30,),
          cusButton(text: isEdit ? 'Edit' : 'Create')
        ],
      ),),
    );
  }
}