import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/screens/BaseScreen.dart';
import 'package:flutter_app/SecondAssignment/screens/HomeScreen.dart';

class NavigationController {
  static void navigateToBasePage(BuildContext context, int screenType) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BaseScreen(screenType: screenType)),
    );
  }

  static void navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()),
    );
  }
}
