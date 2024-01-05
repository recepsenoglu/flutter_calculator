import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import '../utils/app_sizes.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculatorAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.getHeight(0.08));

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    const String strBrand = "VINTAGE";
    const String strCalculator = "CALCULATOR";

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.getWidth(0.03),
          top: AppSizes.getHeight(0.015),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: AppSizes.getWidth(0.35),
              ),
              child: FittedBox(
                child: Text(
                  strBrand,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: AppSizes.getHeight(0.02)),
                ),
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
      ),
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeProvider, child) {
        return Switch.adaptive(
          value: themeProvider.isDark,
          onChanged: (isDark) {
            themeProvider.changeTheme(isDark);
          },
          activeColor: const Color(0xFF363636),
          trackColor: MaterialStateProperty.all<Color>(Colors.black),
          thumbColor: MaterialStateProperty.all<Color>(
            themeProvider.isDark
                ? const Color(0xFF75C0D0)
                : const Color(0xFFEBB04F),
          ),
        );
      },
    );
  }
}

class _SolarPanels extends StatelessWidget {
  const _SolarPanels();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: AppSizes.getWidth(0.2),
        height: AppSizes.getHeight(0.08),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          top: AppSizes.getHeight(0.03),
          right: AppSizes.getWidth(0.03),
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            final double size = AppSizes.getWidth(0.05);
            final double margin = AppSizes.getWidth(0.007);

            return Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? 0 : AppSizes.getWidth(0.01)),
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
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: AppSizes.getWidth(0.01));
          },
        ),
      ),
    );
  }
}
