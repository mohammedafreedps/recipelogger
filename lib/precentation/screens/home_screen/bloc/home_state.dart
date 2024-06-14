part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class RecipesLoadingState extends HomeState{}
final class RecipesLoadedState extends HomeState{
  final bool? isEmpty;
  RecipesLoadedState({this.isEmpty});
}

final class RecipesDeletedState extends HomeState{}

final class HomeErrorState  extends HomeState{
  final String message;
  HomeErrorState({required this.message});
}

final class DashBoardLoaadedState extends HomeState{}