import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/app_sizes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constant/calculator_keys.dart';
import 'calculator_button.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    double spacings = AppSizes.getHeight(0.02);
    if (AppSizes.isBigAspectRatio) spacings = AppSizes.getHeight(0.005);

    return Padding(
      padding: AppSizes.getHorizontalPadding(0.05).copyWith(
          bottom: AppSizes.isBigAspectRatio ? 10 : AppSizes.getHeight(0.02)),
      child: SizedBox(
        width: double.infinity,
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          crossAxisSpacing: spacings,
          mainAxisSpacing: spacings,
          children: List.generate(19, (index) {
            final String keyLabel = CalculatorKeys.keys.keys.toList()[index];
            final KeyType keyType = CalculatorKeys.keys.values.toList()[index];

            return StaggeredGridTile.count(
              crossAxisCellCount: index == 16 ? 2 : 1,
              mainAxisCellCount: 1,
              child: CalculatorButton(
                label: keyLabel,
                keyType: keyType,
              ),
            );
          }),
        ),
      ),
    );
  }
}
