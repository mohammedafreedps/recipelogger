import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_bloc_event.dart';
part 'log_in_bloc_state.dart';

class LoginBloc extends Bloc<LogInBlocEvent, LogInBlocState> {
  LoginBloc() : super(LogInBlocInitial()) {
    on<LogInButtonPressedEvent>((event, emit) async {
      if(event.email.isEmpty){
        emit(IncorrectEmailOrPasswordState(message: 'Enter Email'));
       
      }
      if(event.password.isEmpty){
        emit(IncorrectEmailOrPasswordState(message: 'Enter Password'));
      }
      if(event.email.isNotEmpty && event.password.isNotEmpty){
        emit(LogInLoadingState());
         
        String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
        RegExp regexp = RegExp(emailPattern);
        if(regexp.hasMatch(event.email)){
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email.trim(), password: event.password.trim());
            emit(LogInLoadedState());
          }on FirebaseAuthException catch(e) {
            emit(IncorrectEmailOrPasswordState(message: e.message!));
          }
        }else{
          emit(IncorrectEmailOrPasswordState(message: 'Enter valid Email format'));
        }
      }
    });
  }
}
