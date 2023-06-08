import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomButton.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomEditText.dart';
import 'package:flutter_app/utils/NavigationController.dart';
import 'package:flutter_app/utils/Strings.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/FooterLayout.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/HeaderLayout.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SocialLoginScreen();
}

class _SocialLoginScreen extends State {
  final int googleLogin = 200;
  final int facebookLogin = 201;
  final int login = 202;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        HeaderLayout(firstText: Strings.welcome, secondText: Strings.joinText),
        CustomButton(
            buttonText: Strings.google,
            textColor: Colors.black,
            bgColor: Colors.white,
            assetImage: AssetImage("images/google_icon.png"),
            onPressed: () {
              onClick(googleLogin, context);
            }),
        CustomButton(
            buttonText: Strings.facebook,
            textColor: Colors.white,
            bgColor: Colors.blueAccent,
            assetImage: AssetImage("images/facebook_icon.png"),
            onPressed: () {
              onClick(facebookLogin, context);
            }),
        CustomButton(
            buttonText: Strings.login,
            textColor: Colors.white,
            onPressed: () {
              onClick(login, context);
            }),
        FooterLayout(
            firstText: Strings.donotHaveAccount,
            secondText: Strings.createAccount,
            onPressed: () {
              onClick(0, context);
            }),
      ],
    );
  }
}

void onClick(int loginType, BuildContext context) {
  switch (loginType) {
    case 200: //google login
      break;
    case 201: //facebook login
      break;
    case 202:
      NavigationController.navigateToBasePage(context, 1);
      break;
    default:
      NavigationController.navigateToBasePage(context, 2);
      break;
  }
}
