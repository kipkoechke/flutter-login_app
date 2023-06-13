import 'package:flutter/material.dart';
import 'package:login_app/constants/colors.dart';

class BTextFormFieldTheme {
  BTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: bSecondaryColor,
    floatingLabelStyle: const TextStyle(color: bSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 2, color: bSecondaryColor),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: bPrimaryColor,
    floatingLabelStyle: const TextStyle(color: bPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 2, color: bPrimaryColor),
    ),
  );
}
