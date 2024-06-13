import 'package:flutter/material.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/user_added_recipes_tile.dart';
import 'package:recipelog/precentation/screens/recipe_detail_screen/recipe_detail_screen.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Widget userAddedRecipes() {
  return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(onTap: (){
              Navigators.pushNavigate(context: context, page: const RecipeDetailScreen());
            }, child: userAddedTile());
          }));
}
