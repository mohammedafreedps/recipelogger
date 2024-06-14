import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardInitial()) {
    
    on<LoadDashBoardEvent>((event, emit) {
      categoryPrecent.clear();
      categoryWiseTotal.clear();
      totalRecipes = 0;
      yourTotalRecipes = 0;
      Set<String> categorySet = {};

      for (int i = 0; i < recipes.length; i++) {
        categorySet.add(recipes[i].category);
      }

      categoryPrecent = categorySet.toList();

      for (String category in categoryPrecent) {
        int count = recipes
            .where((recipe) =>
                recipe.category == category &&
                recipe.userEmail == FirebaseAuth.instance.currentUser!.email)
            .length;
        int tCount =
            recipes.where((recipe) => recipe.category == category).length;
        int countUserAdded = recipes
            .where((recipe) =>
                recipe.category == category &&
                recipe.userEmail == FirebaseAuth.instance.currentUser!.email)
            .length;
        categoryWiseTotal.add(count);
        totalRecipes += tCount;
        yourTotalRecipes += countUserAdded;
        emit(DashBoardLoaadedState(
            categoryPrecent: categoryPrecent,
            categoryWiseTotal: categoryWiseTotal,
            totalRecipes: totalRecipes,
            yourTotalRecipes: yourTotalRecipes));
      }
    });
  }
}
