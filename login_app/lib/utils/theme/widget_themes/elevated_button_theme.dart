import 'package:flutter/material.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/sizes.dart';

/*-- Light and Dark Elevated Button Theme--*/

class BElevatedButtonTheme {
  BElevatedButtonTheme._();

  /*-- Light Theme --*/
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: bSecondaryColor,
      foregroundColor: bWhiteColor,
      side: const BorderSide(color: bSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: bButtonHeight),
    ),
  );

  /*-- Dark Theme --*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: bWhiteColor,
      foregroundColor: bSecondaryColor,
      side: const BorderSide(color: bSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: bButtonHeight),
    ),
  );
}
