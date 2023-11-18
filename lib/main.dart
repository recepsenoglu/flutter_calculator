import 'package:flutter/material.dart';
import 'package:flutter_calculator/model/theme_model.dart';
import 'package:flutter_calculator/utils/app_sizes.dart';
import 'feature/calculator_view.dart';
import 'model/calculator_model.dart';
import 'constant/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
      ChangeNotifierProvider<CalculatorModel>(create: (_) => CalculatorModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Calculator App',
          home: const CalculatorView(),
          themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
