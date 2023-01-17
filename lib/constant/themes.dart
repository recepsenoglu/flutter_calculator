import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFFEFEFEF),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
);
