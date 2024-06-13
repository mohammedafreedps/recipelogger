import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipelog/precentation/screens/home_screen/home_screen.dart';
import 'package:recipelog/precentation/screens/log_in_screen/bloc/log_in_bloc_bloc.dart';
import 'package:recipelog/precentation/screens/log_in_screen/log_in_screen.dart';
import 'package:recipelog/precentation/screens/sign_in_screen/bloc/sign_in_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAdfdhSuHPAgjZJhukEmDyQ0K0k1JZj2mY",
            appId: "1:283142673413:android:fb8e952ea9926f4c71786c",
            messagingSenderId: "283142673413",
            projectId: "recipelog-caa9f"));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignInBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return const LogInScreen();
              }
            }),
      ),
    );
  }
}
