import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading30 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading15 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: Colors.grey[400],
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.notoSans(
    color: Colors.grey[400],
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyWhite15 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
}
