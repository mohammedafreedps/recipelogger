import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/local_variables.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonClickedEvent>((event, emit) async {
      emit(SignInLoadingState());
      if (event.name.isEmpty) {
        emit(IncorrectEmailOrPasswordForSignInState(message: 'Enter Name'));
      }
      if (event.location.isEmpty) {
        emit(IncorrectEmailOrPasswordForSignInState(message: 'Enter location'));
      }
      if (event.email.isEmpty) {
        emit(IncorrectEmailOrPasswordForSignInState(message: 'Enter email'));
      }
      if (event.password.isEmpty) {
        emit(IncorrectEmailOrPasswordForSignInState(message: 'Enter password'));
      }
      if (event.comformPassword.isEmpty) {
        emit(IncorrectEmailOrPasswordForSignInState(
            message: 'Enter Comform Password'));
      }

      if (event.password != event.comformPassword) {
        emit(IncorrectEmailOrPasswordForSignInState(
            message: 'Password not matched'));
      }

      if (event.email.isNotEmpty &&
          event.password == event.comformPassword &&
          event.password.isNotEmpty &&
          event.comformPassword.isNotEmpty &&
          event.name.isNotEmpty &&
          event.location.isNotEmpty) {
        String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
        RegExp regexp = RegExp(emailPattern);
        if (regexp.hasMatch(event.email)) {
          final imageUrl;
          try {
            if (profileImageLocal.isNotEmpty) {
              final imageName = DateTime.now().toString();
              final pathInFirestore = 'images/$imageName';
              final ref = FirebaseStorage.instance.ref().child(pathInFirestore);
              await ref.putFile(File(profileImageLocal));
              imageUrl = await ref.getDownloadURL();
            } else {
              imageUrl = '';
            }
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: event.email.trim(), password: event.password.trim());
            await FirebaseFirestore.instance.collection('users').add({
              'profileUrl': imageUrl,
              'name': event.name,
              'location': event.location
            });
            profileImageLocal = '';
            emit(SignInLoadedState());
          } on FirebaseAuthException catch (e) {
            emit(IncorrectEmailOrPasswordForSignInState(message: e.message!));
          }
        }
      }
    });
    on<SelectProfilePicFromCameraEvent>(
      (event, emit) async {
        final ImagePicker picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          profileImageLocal = pickedFile.path;
          emit(SelectedProfilePicState());
        }
      },
    );
    on<SelectProfilePicFromGalleryEvent>(
      (event, emit) async {
        final ImagePicker picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          profileImageLocal = pickedFile.path;
          emit(SelectedProfilePicState());
        }
      },
    );
  }
}
