import 'package:flutter/material.dart';
import 'calculator/calculator_view.dart';
import 'model/calculator_model.dart';
import 'constant/themes.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
