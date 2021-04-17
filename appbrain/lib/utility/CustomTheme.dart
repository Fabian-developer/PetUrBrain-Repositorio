import 'package:flutter/material.dart';

import 'Style.dart';

// ignore: avoid_classes_with_only_static_members
class CustomTheme {
  // LIGHT
  static ThemeData light = ThemeData(
    accentColor: Colored.white,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      color: Colored.group01Medium,
      iconTheme: IconThemeData(
        color: Colored.white,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black.withOpacity(0),
    ),
    brightness: Brightness.light,
    buttonColor: Colored.greenDark,
    colorScheme: _ColorScheme.light,
    disabledColor: Colored.black,
    indicatorColor: Colored.greenLight,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    primaryColor: Colored.grayMedium,
    primaryColorDark: Colored.grayDark,
    primaryColorLight: Colored.grayLight,
    scaffoldBackgroundColor: Colored.backGroundLight,
    splashColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colored.group01Medium,
      selectionColor: Colored.backGroundLight,
      selectionHandleColor: Colored.group01Medium,
    ),
  );
}

class _ColorScheme {
  static ColorScheme get light => _colorScheme(Brightness.light);

  static ColorScheme _colorScheme(Brightness brightness) => ColorScheme(
        brightness: brightness,
        // GROUP01
        primary: Colored.group01Light,
        primaryVariant: Colored.group01Medium,
        onPrimary: Colored.group01Dark,
        // GROUP02
        secondary: Colored.group02Light,
        secondaryVariant: Colored.group02Medium,
        onSecondary: Colored.group02Dark,
        // GROUP03
        background: Colored.group03Light,
        error: Colored.group03Medium,
        onBackground: Colored.group03Dark,
        // GROUP04
        onError: Colored.group04Light,
        onSurface: Colored.group04Medium,
        surface: Colored.group04Dark,
      );
}
