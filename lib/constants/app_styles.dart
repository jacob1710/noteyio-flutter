import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyles{
  static const TextStyle kDarkTextStyle = TextStyle(
    color: kDefaultDarkColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle kPrimaryTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const Color kDefaultDarkColor = Color(0xFF27272B);
  static const Color kPrimaryColor = Color(0xFFFF59F8);
}