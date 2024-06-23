import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  const WText({
    super.key,
    required this.text,
    this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.signika(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight
        ),
      ),
    );
  }
}
