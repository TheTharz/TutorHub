import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: 24,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
  );
}
