import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/calculator/calculator_view.dart';
import 'package:flutter_calculator/model/calculator_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CalculatorModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator App',
      home: const CalculatorView(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFFEFEFEF),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
    );
  }
}
