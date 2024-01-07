import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import '../utils/app_sizes.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: AppSizes.getWidth(0.32),
      toolbarHeight: AppSizes.getHeight(0.08),
      title: const _ThemeSwitch(),
      leading: const _BrandName(),
      actions: const [_SolarPanels()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.getHeight(0.08));
}

class _BrandName extends StatelessWidget {
  const _BrandName();

  @override
  Widget build(BuildContext context) {
    const String strBrand = "VINTAGE";
    const String strCalculator = "CALCULATOR";

    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.getWidth(0.03),
        top: AppSizes.getHeight(0.015),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              strBrand,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: AppSizes.getHeight(0.02)),
            ),
          ),
          Text(
            strCalculator,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: AppSizes.getHeight(0.015)),
          ),
        ],
      ),
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch();

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Switch.adaptive(
      value: themeModel.isDark,
      onChanged: (value) {
        themeModel.isDark = value;
      },
      activeColor: const Color(0xFF363636),
      trackColor: MaterialStateProperty.all<Color>(Colors.black),
      thumbColor: MaterialStateProperty.all<Color>(
        themeModel.isDark ? const Color(0xFF75C0D0) : const Color(0xFFEBB04F),
      ),
    );
  }
}

class _SolarPanels extends StatelessWidget {
  const _SolarPanels();

  @override
  Widget build(BuildContext context) {
    final double size = AppSizes.getWidth(0.05);
    final double margin = AppSizes.getWidth(0.007);

    List<Widget> buildSolarPanels() {
      List<Widget> panels = [];
      for (int i = 0; i < 4; i++) {
        panels.add(
          Padding(
            padding:
                EdgeInsets.only(left: i == 0 ? 0 : AppSizes.getWidth(0.01)),
            child: Stack(
              children: [
                Container(
                  width: size,
                  height: size,
                  margin: EdgeInsets.only(left: margin, top: margin),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  width: size,
                  height: size,
                  margin: EdgeInsets.only(right: margin, bottom: margin),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: AppSizes.getWidth(0.005),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return panels;
    }

    return Container(
      width: AppSizes.getWidth(0.35),
      height: AppSizes.getHeight(0.08),
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(
        top: AppSizes.getHeight(0.03),
        right: AppSizes.getWidth(0.03),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: buildSolarPanels(),
      ),
    );
  }
}
