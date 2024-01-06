import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();
  static const lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );
  static const darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );
}
