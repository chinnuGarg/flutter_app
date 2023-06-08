import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  const CustomEditText(
      {super.key,
      this.controller,
      this.hint,
      this.icon,
      this.isPassword = false,
      this.textInputType});

  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: TextField(
        controller: controller,
        maxLines: 1,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white60),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
