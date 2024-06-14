part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class FechDateEvent extends HomeEvent {}

final class RecipeDeleteButtonClickedEvent extends HomeEvent {
  final int index;
  RecipeDeleteButtonClickedEvent({required this.index});
}

