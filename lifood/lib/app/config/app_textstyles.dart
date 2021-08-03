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
  // home
  static final TextStyle homeDateTextStyle = GoogleFonts.poppins(
    fontSize: 18,
    color: Colors.white,
  );
  static final TextStyle homeFieldTextStyle = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.white,
  );
  static final TextStyle homeTitleTextStyle = GoogleFonts.poppins(
    fontSize: 22,
    color: Colors.white,
  );
  static final TextStyle homeCategorieButtonTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: Colors.white,
  );
  // home -> drawer
  static final TextStyle homeDrawerItemTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: Colors.white,
  );
  // home -> detail
  static final TextStyle homeDetailDescriptionTextStyle = GoogleFonts.adventPro(
    fontSize: 15,
    color: Colors.grey[300],
  );
  static final TextStyle homeDetailIngredientsTitleTextStyle =
      GoogleFonts.adventPro(
    fontSize: 25,
    color: Colors.grey[300],
  );
  static final TextStyle homeDetailIngredientsButtonTextStyle =
      GoogleFonts.adventPro(
    fontSize: 18,
    color: Colors.white,
  );
}
