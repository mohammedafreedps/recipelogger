part of 'create_edit_bloc.dart';

@immutable
sealed class CreateEditState {}

final class CreateEditInitial extends CreateEditState {}

final class RecipeCreatedSuccusfullyState extends CreateEditState{}

final class RecipeCreatingState extends CreateEditState{}

final class RecipeCreatedUnsuccesState extends CreateEditState{
  final String message;
  RecipeCreatedUnsuccesState({required this.message});
}