part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardState {}

final class DashBoardInitial extends DashBoardState {}

final class DashBoardLoaadedState extends DashBoardState {
  final int totalRecipes ;
  final int yourTotalRecipes ;
  final List<String> categoryPrecent ;
  final List<int> categoryWiseTotal ;
  DashBoardLoaadedState({required this.totalRecipes,required this.yourTotalRecipes,required this.categoryPrecent,required this.categoryWiseTotal});
}
