import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/local_variables.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/widgets/select_dialog.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget addProfile({required BuildContext context}) {
  return Column(
    children: [
      Text(
        'Sign In',
        style: TextStyles.primaryBold.copyWith(fontSize: 40),
      ),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () {
          selectDialog(context: context);
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SelectedProfilePicState) {
              return profileImageLocal.isEmpty
                  ? const CircleAvatar(
                      radius: 65,
                    )
                  : CircleAvatar(
                    backgroundColor: AppColor.secondaryColor,
                      radius: 65,
                      backgroundImage: FileImage(File(profileImageLocal)),
                    );
            } else {
              return profileImageLocal.isEmpty
                  ? CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 65,
                      child: Icon(
                        Icons.add_a_photo,
                        color: AppColor.acsentColor,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: AppColor.secondaryColor,
                      radius: 65,
                      backgroundImage: FileImage(File(profileImageLocal)),
                      child: Icon(
                        Icons.add_a_photo,
                        color: AppColor.acsentColor,
                      ),
                    );
            }
          },
        ),
      )
    ],
  );
}
