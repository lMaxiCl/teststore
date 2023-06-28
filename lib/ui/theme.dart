import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(5),
      border: UnderlineInputBorderWithCustomEndings(),
      focusedBorder: UnderlineInputBorderWithCustomEndings(),
      // enabledBorder: UnderlineInputBorderWithCustomEndings(),
      // disabledBorder: UnderlineInputBorderWithCustomEndings(),
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
          fontFamily: GoogleFonts.prata().fontFamily, color: Colors.black),
    ),
  );
}

class UnderlineInputBorderWithCustomEndings extends UnderlineInputBorder {
  const UnderlineInputBorderWithCustomEndings()
      : super(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.teal,
          ),
        );
  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    if (borderRadius.bottomLeft != Radius.zero ||
        borderRadius.bottomRight != Radius.zero) {
      canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
    }
    final p1 = Offset(rect.left + 0.5, rect.bottom - 5);
    final p2 = Offset(rect.left + 0.5, rect.bottom);
    final p3 = Offset(rect.right - 0.5, rect.bottom - 5);
    final p4 = Offset(rect.right - 0.5, rect.bottom);
    canvas.drawLine(p1, p2, borderSide.toPaint());
    canvas.drawLine(p3, p4, borderSide.toPaint());
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, borderSide.toPaint());
  }
}
