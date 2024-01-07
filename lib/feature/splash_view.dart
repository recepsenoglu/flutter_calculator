import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/themes.dart';
import '../model/theme_model.dart';
import '../utils/app_sizes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _loadThemeAndNavigate();
  }

  void _loadThemeAndNavigate() async {
    await Provider.of<ThemeModel>(context, listen: false).loadPreferences();
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(context, "/calculator");
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Scaffold(
      backgroundColor: lightTheme.scaffoldBackgroundColor,
      body: const SizedBox(),
    );
  }
}
