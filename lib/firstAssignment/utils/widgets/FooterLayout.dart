import 'package:flutter/material.dart';

class FooterLayout extends StatelessWidget {
  const FooterLayout(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.onPressed});

  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            firstText,
            style: const TextStyle(color: Colors.white60, fontSize: 15),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 25),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                secondText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
