part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class IncorrectEmailOrPasswordForSignInState extends SignInState{
  final String message;
  IncorrectEmailOrPasswordForSignInState({required this.message});
}
final class SignInLoadingState extends SignInState{}
final class SignInLoadedState extends SignInState{}

final class SelectedProfilePicState extends SignInState{}
