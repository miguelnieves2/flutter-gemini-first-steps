import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.grey,
  Colors.blueGrey,
  Colors.blue,
  Colors.blueAccent,
  Colors.blueGrey,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.teal,
  Colors.green,
  Colors.amber,
  Colors.red,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(
          selectedColor >= 0,
          'Selected color must be greater than 0',
        ),
        assert(
          selectedColor < colorList.length,
          'Selected color must be less or equal than ${colorList.length - 1}',
        );

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );
}
