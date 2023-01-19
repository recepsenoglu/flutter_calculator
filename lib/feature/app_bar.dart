import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import '../product/widgets/solar_panel_box.dart';

class CalculatorAppBar extends StatelessWidget with PreferredSizeWidget {
  const CalculatorAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _brandName(context),
          _themeSwitch(context),
          _solarPanels(),
        ],
      ),
    );
  }

  Widget _brandName(BuildContext context) {
    const String strCasio = "CASIO";
    const String strCalculator = "CALCULATOR";

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strCasio, style: Theme.of(context).textTheme.titleMedium),
            Text(strCalculator, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }

  Widget _themeSwitch(BuildContext context) {
    return Expanded(
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeProvider, child) {
          return CupertinoSwitch(
            value: themeProvider.isDark,
            onChanged: (isDark) {
              themeProvider.changeTheme(isDark);
            },
            activeColor: const Color(0xFF363636),
            trackColor: Colors.white,
            thumbColor:
                themeProvider.isDark ? const Color(0xFF75C0D0) : const Color(0xFFEBB04F),
          );
        },
      ),
    );
  }

  Widget _solarPanels() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 18, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...List.generate(4, (index) => const SolarPanelBox()),
          ],
        ),
      ),
    );
  }
}
