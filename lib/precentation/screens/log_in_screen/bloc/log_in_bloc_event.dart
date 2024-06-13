part of 'log_in_bloc_bloc.dart';

@immutable
sealed class LogInBlocEvent {}

class LogInButtonPressedEvent extends LogInBlocEvent{
  final String email;
  final String password;
  LogInButtonPressedEvent({required this.email, required this.password});
}