import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/app_styles.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onTapped;

  const DefaultButton({Key? key, required this.onTapped, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapped,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      style: ElevatedButton.styleFrom(
        primary: AppStyles.kPrimaryColor,
      )
    );
  }
}
