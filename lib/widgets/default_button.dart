import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onTapped;
  final Color buttonColor;
  final Color textColor;

  const DefaultButton({
    Key? key, required this.onTapped,
    required this.text,
    this.buttonColor = AppStyles.kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapped,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
      )
    );
  }
}
