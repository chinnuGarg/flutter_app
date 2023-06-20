import 'package:flutter/material.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomButton.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/CustomEditText.dart';
import 'package:flutter_app/utils/NavigationController.dart';
import 'package:flutter_app/utils/Strings.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/FooterLayout.dart';
import 'package:flutter_app/firstAssignment/utils/widgets/HeaderLayout.dart';
import 'package:flutter_app/utils/Utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State {
  final int login = 202;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cityController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _collegeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _mobileNumberController.dispose();
    _collegeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
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
            controller: _cityController, hint: Strings.city, icon: Icons.home),
        CustomEditText(
            controller: _mobileNumberController,
            hint: Strings.mobileNumber,
            icon: Icons.phone),
        CustomEditText(
            controller: _collegeController,
            hint: Strings.college,
            icon: Icons.computer),
        CustomEditText(
            controller: _passwordController,
            hint: Strings.password,
            icon: Icons.key),
        CustomButton(
            buttonText: Strings.register,
            textColor: Colors.black,
            bgColor: Colors.white,
            onPressed: () {
              onClick(0, context);
            }),
        FooterLayout(
            firstText: Strings.alreadyHaveAccount,
            secondText: Strings.login,
            onPressed: () {
              onClick(login, context);
            }),
      ],
    ));
  }

  void onClick(int loginType, BuildContext context) {
    if (loginType == login) {
      NavigationController.navigateToBasePage(context, 0);
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
    } else if (_cityController.text.isEmpty) {
      Utils.showToast(Strings.cityError);
    } else if (_mobileNumberController.text.isEmpty) {
      Utils.showToast(Strings.mobileNumberError);
    } else if (_collegeController.text.isEmpty) {
      Utils.showToast(Strings.collegeError);
    } else {
      Utils.showToast(Strings.registerSuccess);
      NavigationController.navigateToHomePage(context);
    }
  }
}
