import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get onPrimary => computeLuminance() < 0.5 ? Colors.white : Colors.black;
}