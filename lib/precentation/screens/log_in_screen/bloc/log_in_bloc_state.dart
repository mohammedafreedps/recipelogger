part of 'log_in_bloc_bloc.dart';

@immutable
sealed class LogInBlocState {}

final class LogInBlocInitial extends LogInBlocState {}

final class IncorrectEmailOrPasswordState extends LogInBlocState {
  final String message;
  IncorrectEmailOrPasswordState({required this.message});
}

final class LogInLoadingState extends LogInBlocState{}
final class LogInLoadedState extends LogInBlocState{}