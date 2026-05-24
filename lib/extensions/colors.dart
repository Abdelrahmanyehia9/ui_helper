import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withAppOpacity(double opacity) {
    return withValues(alpha: opacity);
  }

  Color lighten([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  Color get veryLight => withAppOpacity(0.2).lighten(0.2);
  String get toHex {
    return '0x${toARGB32().toRadixString(16)}';
  }
  static Color fromHex(String hex) {
    hex = hex.replaceAll('#', '').replaceAll('0x', '');

    if (hex.length == 6) {
      hex = 'ff$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }
}

