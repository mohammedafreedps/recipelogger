import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/create_edit_screen/widgets/appbar.dart';
import 'package:recipelog/precentation/screens/widgets/cus_icon_button.dart';
import 'package:recipelog/precentation/style_manager.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: apBar(),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal:  20),child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cusIconButton(icon: Icons.edit, ),
              const SizedBox(width: 20,),
              cusIconButton(icon: Icons.delete)
            ],
          )
        ],
      ),),
    );
  }
}