import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/widgets/add_profile.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/widgets/fill_up_sign_up.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/widgets/sign_in_butons.dart';
import 'package:recipelog/precentation/screens/widgets/bottom_snack_bar.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final comformPasswordController = TextEditingController();
    final locationController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoadedState) {
            Navigators.popNavigate(context: context);
          }
          if (state is IncorrectEmailOrPasswordForSignInState) {
            bottomSnakBar(context: context, message: state.message);
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  addProfile(context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  fillUpSignIn(
                      name: nameController,
                      email: emailController,
                      password: passwordController,
                      comformPassword: comformPasswordController,
                      location: locationController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInButtons(
                      context: context,
                      name: nameController,
                      email: emailController,
                      password: passwordController,
                      comformPassword: comformPasswordController,
                      location: locationController)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
