import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/themes.dart';
import 'feature/calculator_view.dart';
import 'feature/splash_view.dart';
import 'model/theme_model.dart';
import 'utils/app_sizes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel()..loadPreferences()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeProvider, child) {
        AppSizes.init(context);
        return MaterialApp(
          title: 'Vintage Calculator',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashView(),
            "/calculator": (context) => const CalculatorView(),
          },
        );
      },
    );
  }
}
