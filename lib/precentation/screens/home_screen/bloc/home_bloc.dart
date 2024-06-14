import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:recipelog/models/recipe_model.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FechDateEvent>((event, emit) async {
      try {
        currentUser = FirebaseAuth.instance.currentUser;
        print(currentUser!.email);
        emit(RecipesLoadingState());
        QuerySnapshot<Map<String, dynamic>> records =
            await FirebaseFirestore.instance.collection('recipes').get();
        List<RecipeModel> recipe = records.docs
            .map((doc) => RecipeModel.fromMap(doc.id, doc.data()))
            .toList();
        recipes = recipe;
        if (recipe.isEmpty) {
          emit(RecipesLoadedState(isEmpty: true));
        } else {
          emit(RecipesLoadedState());
        }
      } on FirebaseAuthException catch (e) {
        emit(HomeErrorState(message: e.message!));
      }
    });

    on<RecipeDeleteButtonClickedEvent>(
      (event, emit) async {
        try {
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('recipes')
              .doc(recipes[event.index].docId);
          await documentReference.delete();
          emit(RecipesDeletedState());
        } on FirebaseAuthException catch (e) {
          emit(HomeErrorState(message: e.message!));
        }
      },
    );

    on<LoadDashBoardEvent>(
      (event, emit) {
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
        }
      },
    );
  }
}
