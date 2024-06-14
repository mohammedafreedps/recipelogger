import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:recipelog/precentation/screens/home_screen/bloc/local_variable.dart';

part 'create_edit_event.dart';
part 'create_edit_state.dart';

class CreateEditBloc extends Bloc<CreateEditEvent, CreateEditState> {
  CreateEditBloc() : super(CreateEditInitial()) {
    on<RecipeCreateButtonClicked>((event, emit) async {
      final cU = FirebaseAuth.instance.currentUser;
      emit(RecipeCreatingState());
      if (event.recipeName.isEmpty) {
        emit(RecipeCreatedUnsuccesState(message: 'Enter Recipe Name'));
      }
      if (event.category.isEmpty) {
        emit(RecipeCreatedUnsuccesState(message: 'Enter Category'));
      }
      if (event.recipeName.isNotEmpty && event.category.isNotEmpty) {
        if (currentUser != null) {
          try {
            FirebaseFirestore.instance.collection('recipes').add({
              'userEmail':  cU!.email,
              'recipeName': event.recipeName,
              'category': event.category
            });
            emit(RecipeCreatedSuccusfullyState());
          } on FirebaseAuthException catch (e) {
            emit(RecipeCreatedUnsuccesState(message: e.message!));
          }
        }
      }
    });

    on<RecipeEditButtonClicked>(
      (event, emit) async {
        emit(RecipeCreatingState());
        if (event.recipeName.isEmpty) {
          emit(RecipeCreatedUnsuccesState(message: 'Enter Recipe Name'));
        }
        if (event.category.isEmpty) {
          emit(RecipeCreatedUnsuccesState(message: 'Enter Category'));
        }
        if (event.recipeName.isNotEmpty && event.category.isNotEmpty) {
          if (currentUser != null) {
            try {
              DocumentReference documentReference = FirebaseFirestore.instance
                  .collection('recipes')
                  .doc(event.docId);
              Map<String, dynamic> updatedData = {
                'recipeName': event.recipeName,
                'category': event.category
              };
              await documentReference.update(updatedData);
              emit(RecipeCreatedSuccusfullyState());
            } on FirebaseAuthException catch (e) {
              emit(RecipeCreatedUnsuccesState(message: e.message!));
            }
          }
        }
      },
    );
  }
}
