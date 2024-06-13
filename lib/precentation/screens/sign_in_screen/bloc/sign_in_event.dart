part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInButtonClickedEvent extends SignInEvent {
  final String name;
  final String email;
  final String password;
  final String comformPassword;
  final String location;
  SignInButtonClickedEvent(
      {required this.name,
        required this.email,
      required this.password,
      required this.comformPassword,
      required this.location});
}

final class SelectProfilePicFromCameraEvent extends SignInEvent {}

final class SelectProfilePicFromGalleryEvent extends SignInEvent {}
