import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculatorAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52,
      titleSpacing: 0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BrandName(),
          _ThemeSwitch(),
          _SolarPanels(),
        ],
      ),
    );
  }
}

class _BrandName extends StatelessWidget {
  const _BrandName();

  @override
  Widget build(BuildContext context) {
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
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch();

  @override
  Widget build(BuildContext context) {
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
            thumbColor: themeProvider.isDark
                ? const Color(0xFF75C0D0)
                : const Color(0xFFEBB04F),
          );
        },
      ),
    );
  }
}

class _SolarPanels extends StatelessWidget {
  const _SolarPanels();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 18, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Stack(
                  children: [
                    Container(
                      width: 21,
                      height: 21,
                      margin: const EdgeInsets.only(left: 2.5, top: 2.5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    Container(
                      width: 21,
                      height: 21,
                      margin: const EdgeInsets.only(right: 2.5, bottom: 2.5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                              width: 2),
                          borderRadius: BorderRadius.circular(1)),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
