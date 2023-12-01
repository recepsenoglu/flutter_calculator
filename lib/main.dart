import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/themes.dart';
import 'feature/calculator_view.dart';
import 'model/calculator_model.dart';
import 'model/theme_model.dart';
import 'utils/app_sizes.dart';

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
          title: 'Vintage Calculator',
          home: const CalculatorView(),
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
        );
      },
    );
  }
}
