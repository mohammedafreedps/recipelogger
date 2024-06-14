import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/module.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';
import 'package:recipelog/precentation/style_manager.dart';

Widget dashBoard({required BuildContext context}) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Text(
          'Recipe',
          style: TextStyles.primaryBold.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (categoryPrecent.isNotEmpty) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    module(title: 'Total', value: totalRecipes.toString()),
                    module(title: 'Your', value: yourTotalRecipes.toString())
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
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (categoryPrecent.isNotEmpty) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryPrecent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return module(
                          title: categoryPrecent[index],
                          value: categoryWiseTotal[index].toString());
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
