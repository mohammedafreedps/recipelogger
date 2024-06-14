import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/log_in_screen/bloc/log_in_bloc_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:recipelog/precentation/screens/widgets/cus_button.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Widget logInButton({required BuildContext context, required TextEditingController emailController,required TextEditingController passwordController}) {
  return Column(
    children: [
      TextButton(onPressed: (){
        Navigators.pushNavigate(context: context, page: const SignInScreen());
      }, child: Text('Sign In',style: TextStyles.primaryNormal,)),
      const SizedBox(height: 30,),
      BlocBuilder<LoginBloc, LogInBlocState>(
        builder: (context, state) {
          if (state is LogInLoadingState) {
            return loadingCircle();
          } else {
            return cusButton(
                text: 'Log In',
                function: () {
                  context.read<LoginBloc>().add(LogInButtonPressedEvent(
                      email: emailController.text,
                      password: passwordController.text));
                });
          }
        },
      )
    ],
  );
}
