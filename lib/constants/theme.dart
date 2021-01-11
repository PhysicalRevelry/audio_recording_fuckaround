import 'package:flutter/material.dart';

ThemeData openTheme() {
  TextTheme basicTextTheme(TextTheme base){
    return base.copyWith(
      headline1: base.headline1.copyWith(),
      headline2: base.headline2.copyWith(),
      headline3: base.headline3.copyWith(),
      caption: base.caption.copyWith(),
      button: base.button.copyWith(),
      subtitle1: base.subtitle1.copyWith(),
      subtitle2: base.subtitle2.copyWith(),
    );
  }

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: basicTextTheme(base.textTheme),
    scaffoldBackgroundColor: Colors.black,
  );
}