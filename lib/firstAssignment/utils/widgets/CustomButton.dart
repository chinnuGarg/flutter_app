import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.bgColor,
      this.image,
      this.textColor,
      this.assetImage,
      required this.onPressed});

  final String buttonText;
  final Image? image;
  final Color? bgColor;
  final Color? textColor;
  final AssetImage? assetImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: (bgColor != null) ? bgColor : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              side: BorderSide(color: bgColor ?? Colors.white, width: 1),
            ),
            child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15, right: 2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                      child: Text(buttonText,
                          style: TextStyle(
                              color: (textColor != null)
                                  ? textColor
                                  : Colors.white,
                              fontSize: 15))),
                )),
          ),
        ));
  }
}
