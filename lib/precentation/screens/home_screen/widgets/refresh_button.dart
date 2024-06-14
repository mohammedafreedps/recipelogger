import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/dash_board_bloc.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget reFreashButton({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      IconButton(
          onPressed: () {
            context.read<DashBoardBloc>().add(LoadDashBoardEvent());
          },
          icon: Icon(
            Icons.restart_alt,
            color: AppColor.acsentColor,
          )),
    ],
  );
}
