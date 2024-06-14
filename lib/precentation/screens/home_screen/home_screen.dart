import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/dash_board.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/floating_button.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/log_out_button.dart';
import 'package:recipelog/precentation/screens/home_screen/widgets/user_added_recipes.dart';
import 'package:recipelog/precentation/screens/widgets/bottom_snack_bar.dart';
import 'package:recipelog/precentation/style_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is RecipesDeletedState) {
              context.read<HomeBloc>().add(FechDateEvent());
            }
            if (state is HomeErrorState) {
              bottomSnakBar(context: context, message: state.message);
            }
            if(state is RecipesLoadedState){
              context.read<HomeBloc>().add(LoadDashBoardEvent());
            }
          },
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                logOutButton(context: context),
                dashBoard(context: context),
                const Divider(),
                userAddedRecipes()
              ],
            ),
          )),
        ),
        floatingActionButton: floatingButton(context: context));
  }
}
