import 'package:flutter/material.dart';
import 'package:login_app/src/utils/theme/widget_themes/color_scheme_theme.dart';

import 'package:login_app/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:login_app/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:login_app/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:login_app/src/utils/theme/widget_themes/text_theme.dart';

class BAppTheme {
  BAppTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: BColorSchemeTheme.lightColorSchemeTheme,
    brightness: Brightness.light,
    textTheme: BTextTheme.lightTextTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: BElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: BTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: BColorSchemeTheme.darkColorSchemeTheme,
    brightness: Brightness.dark,
    textTheme: BTextTheme.darkTextTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: BElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: BTextFormFieldTheme.darkInputDecorationTheme,
  );
}
