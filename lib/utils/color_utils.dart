import 'package:flutter/material.dart';

class ColorUtils {
  static Color getContrastColor(Color color) {
    // Calculate relative luminance
    final luminance = color.computeLuminance();

    // Return black for light colors, white for dark colors
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  static Color getReadableEventColor(Color baseColor) {
    // Adjust color to ensure good contrast with white text
    final hsl = HSLColor.fromColor(baseColor);

    // If color is too light, darken it
    if (hsl.lightness > 0.7) {
      return hsl.withLightness(0.6).toColor();
    }

    // If color is too dark, lighten it
    if (hsl.lightness < 0.3) {
      return hsl.withLightness(0.4).toColor();
    }

    return baseColor;
  }
}
