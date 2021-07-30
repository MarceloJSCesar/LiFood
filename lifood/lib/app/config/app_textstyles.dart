import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // auth ( login and register )
  static final TextStyle authTextStyle = GoogleFonts.adventPro(
    color: Colors.white,
    fontSize: 18,
  );
  static final TextStyle authTitleTextStyle = GoogleFonts.adventPro(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle authFieldTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.black,
  );
  static final TextStyle authButtonTextStyle = GoogleFonts.adventPro(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle authBottomTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
  );
}
