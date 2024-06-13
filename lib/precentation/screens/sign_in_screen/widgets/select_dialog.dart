import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Future<void> selectDialog({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    context
                        .read<SignInBloc>()
                        .add(SelectProfilePicFromCameraEvent());
                    Navigators.popNavigate(context: context);
                  },
                  child: const Text('Camera')),
              TextButton(
                  onPressed: () {
                    context
                        .read<SignInBloc>()
                        .add(SelectProfilePicFromGalleryEvent());
                    Navigators.popNavigate(context: context);
                  },
                  child: const Text('Gallery')),
            ],
            content: const Text('Do you want to take image from'),
          ));
}
