part of 'create_edit_bloc.dart';

@immutable
sealed class CreateEditEvent {}

final class RecipeCreateButtonClicked extends CreateEditEvent {
  final String recipeName;
  final String category;
  RecipeCreateButtonClicked({required this.recipeName, required this.category});
}

final class RecipeEditButtonClicked extends CreateEditEvent {
  final String docId;
  final String recipeName;
  final String category;
  RecipeEditButtonClicked({required this.docId, required this.recipeName,required this.category});
}
