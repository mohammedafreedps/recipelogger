import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/log_in_screen/bloc/log_in_bloc_bloc.dart';
import 'package:recipelog/precentation/screens/log_in_screen/widgets/fill_up_log_in.dart';
import 'package:recipelog/precentation/screens/log_in_screen/widgets/log_in_buttons.dart';
import 'package:recipelog/precentation/screens/widgets/bottom_snack_bar.dart';
import 'package:recipelog/precentation/style_manager.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: BlocListener<LoginBloc, LogInBlocState>(
        listener: (context, state) {
          if (state is IncorrectEmailOrPasswordState) {
            bottomSnakBar(context: context, message: state.message);
          }
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Log In',
                style: TextStyles.primaryBold.copyWith(fontSize: 40),
              ),
              fillUpLogIn(email: emailController, password: passwordController),
              logInButton(context: context , emailController: emailController, passwordController: passwordController)
            ],
          ),
        )),
      ),
    );
  }
}
