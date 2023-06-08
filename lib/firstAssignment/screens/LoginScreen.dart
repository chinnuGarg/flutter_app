import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomButton.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomEditText.dart';
import 'package:flutter_app/utils/Strings.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/FooterLayout.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/HeaderLayout.dart';
import 'package:flutter_app/utils/Utils.dart';

import '../../utils/NavigationController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State {
  final int register = 203;
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
        const HeaderLayout(
            firstText: Strings.welcome, secondText: Strings.joinText),
        CustomEditText(
            controller: _emailController,
            hint: Strings.email,
            icon: Icons.email,
            textInputType: TextInputType.emailAddress),
        CustomEditText(
            controller: _passwordController,
            hint: Strings.password,
            icon: Icons.key,
            isPassword: true),
        CustomButton(
            buttonText: Strings.register,
            textColor: Colors.black,
            bgColor: Colors.white,
            onPressed: () {
              onClick(1, context);
            }),
        FooterLayout(
            firstText: Strings.donotHaveAccount,
            secondText: Strings.createAccount,
            onPressed: () {
              onClick(register, context);
            }),
      ],
    );
  }

  void onClick(int loginType, BuildContext context) {
    if (loginType == register) {
      NavigationController.navigateToBasePage(context, 2);
    } else {
      validateData();
    }
  }

  void validateData() {
    var emailId = _emailController.text;
    if (emailId.isEmpty) {
      Utils.showToast(Strings.emailEmptyError);
    } else if (!Utils.validateEmailId(emailId)) {
      Utils.showToast(Strings.invalidEmailError);
    } else if (_passwordController.text.isEmpty) {
      Utils.showToast(Strings.passwordError);
    } else {
      Utils.showToast(Strings.loginSuccess);
    }
  }
}
