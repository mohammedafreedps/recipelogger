import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/user_added_recipes_tile.dart';
import 'package:recipelog/precentation/screens/widgets/loading_circle.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';

Widget userAddedRecipes() {
  return Expanded(child: BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is RecipesLoadedState) {
        if (state.isEmpty != null && state.isEmpty!) {
          return Center(
            child: Text(
              'No datas',
              style: TextStyles.primaryNormal,
            ),
          );
        }
        return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return userAddedTile(context: context, index: index);
            });
      } else {
        return Center(child: loadingCircle());
      }
    },
  ));
}
