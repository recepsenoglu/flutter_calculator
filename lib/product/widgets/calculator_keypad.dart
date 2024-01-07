import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../constant/calculator_keys.dart';
import '../../utils/app_sizes.dart';
import 'calculator_button.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    double mainAxisCellCount = 1;
    double mainAxisSpacing = AppSizes.getHeight(0.015);
    double crossAxisSpacing = mainAxisSpacing;

    double maxWidth = AppSizes.getWidth(0.95);
    double maxHeight = AppSizes.getHeight(0.6);
    int columns = 4;
    int rows = 5;

    double gridWidth = maxWidth - (crossAxisSpacing * (columns - 1));
    double buttonHeight = gridWidth / columns;
    double keypadHeight = buttonHeight * rows + (mainAxisSpacing * (rows - 1));

    if (keypadHeight > maxHeight) {
      double mainAxisSpacings = mainAxisSpacing * (rows - 1);
      double newButtonHeight = (maxHeight - mainAxisSpacings) / rows;

      mainAxisCellCount = newButtonHeight / buttonHeight;
    }

    return SizedBox(
      height: maxHeight,
      child: Container(
        width: double.infinity,
        margin: AppSizes.getHorizontalPadding(0.05)
            .copyWith(bottom: AppSizes.getHeight(0.02)),
        alignment: Alignment.bottomCenter,
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          children: List.generate(19, (index) {
            final String keyLabel = CalculatorKeys.keys.keys.toList()[index];
            final KeyType keyType = CalculatorKeys.keys.values.toList()[index];

            return StaggeredGridTile.count(
              crossAxisCellCount: index == 16 ? 2 : 1,
              mainAxisCellCount: mainAxisCellCount,
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
