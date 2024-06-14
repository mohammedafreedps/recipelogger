import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';
import 'package:recipelog/precentation/utils/style_manager.dart';
import 'package:recipelog/precentation/utils/navigators.dart';

Future alertBox(
    {required BuildContext context,
    required int index,
    bool isLogout = false}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColor.secondaryColor,
            content: Text(
              'Do you want to Logout',
              style: TextStyles.primaryNormal,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigators.popNavigate(context: context);
                  },
                  child: Text(
                    "No",
                    style: TextStyles.primaryNormal,
                  )),
              TextButton(
                  onPressed: () async {
                    if (isLogout) {
                      await FirebaseAuth.instance.signOut();
                      currentUser = null;
                      totalRecipes = 0;
                      yourTotalRecipes = 0;
                      categoryPrecent.clear();
                      categoryWiseTotal.clear();
                      Navigators.popNavigate(context: context);
                    } else {
                      context
                          .read<HomeBloc>()
                          .add(RecipeDeleteButtonClickedEvent(index: index));
                      Navigators.popNavigate(context: context);
                    }
                  },
                  child: Text(
                    "Yes",
                    style: TextStyles.primaryNormal,
                  ))
            ],
          ));
}
