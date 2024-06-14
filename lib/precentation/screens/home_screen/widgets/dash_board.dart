import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/dash_board_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/module.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/refresh_button.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget dashBoard({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        reFreashButton(context: context),
        Text(
          'Recipe',
          style: TextStyles.primaryBold.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<DashBoardBloc, DashBoardState>(
          builder: (context, state) {
            if (state is DashBoardLoaadedState) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    module(title: 'Total', value: state.totalRecipes.toString()),
                    module(title: 'Your', value: state.yourTotalRecipes.toString())
                  ]);
            } else {
              return Center(child: loadingCircle(color: AppColor.acsentColor));
            }
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Categorys',
          style: TextStyles.primaryBold.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 90,
          child: BlocBuilder<DashBoardBloc, DashBoardState>(
            builder: (context, state) {
              if (state is DashBoardLoaadedState) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoryPrecent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return module(
                          title: state.categoryPrecent[index],
                          value: state.categoryWiseTotal[index].toString());
                    });
              } else {
                return Center(
                    child: loadingCircle(color: AppColor.acsentColor));
              }
            },
          ),
        )
      ],
    ),
  );
}
