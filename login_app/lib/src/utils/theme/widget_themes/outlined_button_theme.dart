import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/sizes.dart';

/*-- Light and Dark Outlined Button Theme--*/

class BOutlinedButtonTheme {
  BOutlinedButtonTheme._();

  /*-- Light Theme --*/
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    foregroundColor: bSecondaryColor,
    side: const BorderSide(color: bSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: bButtonHeight),
  ));

  /*-- Dark Theme --*/
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    foregroundColor: bWhiteColor,
    side: const BorderSide(color: bWhiteColor),
    padding: const EdgeInsets.symmetric(vertical: bButtonHeight),
  ));
}
