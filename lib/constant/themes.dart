
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFFEFEFEF),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  colorScheme: const ColorScheme.light(
    onSurface: Color(0xFFEFEFEF),
    outline: Colors.black,
    shadow: Colors.black,
    primaryContainer: Color(0xFFDCEDF0),
    secondaryContainer: Color(0xFFF9E9CF),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.michroma().fontFamily,
      letterSpacing: 4,
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFFA8A8A8),
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
    ),
    displayMedium: TextStyle(
      fontSize: 26,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF707070),
    ),
    displayLarge: TextStyle(
      fontSize: 54,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 34,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.roboto().fontFamily,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black, 
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.black, 
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  colorScheme: ColorScheme.light(
    onSurface: Colors.black, 
    outline: Colors.white,
    shadow: Colors.white.withOpacity(0.5),
    primaryContainer: const Color(0xFF142327),
    secondaryContainer: const Color(0xFF2F200A),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.michroma().fontFamily,
      letterSpacing: 4,
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      color: const Color(0xFFF7F7F9),
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
    ),
    displayMedium: TextStyle(
      fontSize: 26,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF9A9A9A),
    ),
    displayLarge: TextStyle(
      fontSize: 54,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 34,
      color: const Color(0xFFCFCFD1),
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.roboto().fontFamily,
    ),
  ),
);
