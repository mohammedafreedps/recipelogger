import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/floating_button.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/log_out_button.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/user_added_recipes.dart';
import 'package:recipelog/precentation/style_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body:  SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           logOutButton(),
            Container(
              width: double.infinity,
              height: 500,
              color: AppColor.secondaryColor,),
            const Divider(),
            userAddedRecipes()
          ],
        ),
      )),
      floatingActionButton: floatingButton(context: context)
    );
  }
}
