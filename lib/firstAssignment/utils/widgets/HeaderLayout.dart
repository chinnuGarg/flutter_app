import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            firstText,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: Text(secondText,
              style: const TextStyle(color: Colors.white60, fontSize: 15)),
        ),
      ],
    );
  }
}
