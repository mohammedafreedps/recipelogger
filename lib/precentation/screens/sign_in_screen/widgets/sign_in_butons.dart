import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:recipelog/precentation/screens/widgets/cus_button.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Widget signInButtons(
    {required BuildContext context,
    required TextEditingController name,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController comformPassword,
    required TextEditingController location}) {
  return Column(
    children: [
      TextButton(
          onPressed: () {
            Navigators.popNavigate(context: context);
          },
          child: Text(
            'Log In',
            style: TextStyles.primaryNormal,
          )),
      const SizedBox(
        height: 30,
      ),
      BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInLoadingState) {
            return loadingCircle();
          } else {
            return cusButton(
                text: 'Sign In',
                function: () {
                  context.read<SignInBloc>().add(SignInButtonClickedEvent(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                      comformPassword: comformPassword.text,
                      location: location.text));
                });
          }
        },
      ),
    ],
  );
}
