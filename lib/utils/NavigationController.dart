import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/screens/BaseScreen.dart';

class NavigationController {
  static void navigateToBasePage(BuildContext context, int screenType) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BaseScreen(screenType: screenType)),
    );
  }
}
