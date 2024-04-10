

import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(15, 216, 213, 16);
const List <Color> colorThemes = [
  _customColor,
Colors.blue,
Colors.green,
Colors.purple,
Colors.orange,
Colors.green,
Colors.red,

];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0

    }):assert(selectedColor >=0 && selectedColor <= colorThemes.length -1, 'Colors be between 0 and $colorThemes.length');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }
}