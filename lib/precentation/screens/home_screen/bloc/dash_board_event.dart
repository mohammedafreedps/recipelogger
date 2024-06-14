part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardEvent {}

final class LoadDashBoardEvent extends DashBoardEvent{}