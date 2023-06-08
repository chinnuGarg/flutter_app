import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/screens/RegisterScreen.dart';
import 'package:flutter_app/firstAssignment/screens/SocialLoginScreen.dart';
import 'LoginScreen.dart';

void main() {
  runApp(const BaseScreen());
}

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, this.screenType = 0});

  final int screenType;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [Colors.black, Colors.transparent],
            )),
            child: loadScreen(screenType),
          ),
        ),
      ),
    );
  }
}

Widget loadScreen(int screenType) {
  switch (screenType) {
    case 1:
      return const LoginScreen();
    case 2:
      return const RegisterScreen();
    default:
      return const SocialLoginScreen();
  }
}
