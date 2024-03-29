import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/calculator_model.dart';
import '../../utils/app_sizes.dart';
import '../canvas/_exports.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String result = Provider.of<CalculatorModel>(context).result;
    final List<String> operations =
        Provider.of<CalculatorModel>(context).operations;
    String operationHistory =
        Provider.of<CalculatorModel>(context).operations.join();
    if (operations.isEmpty) {
      result = "0";
    } else if (operations.length < 4) {
      if (result.isEmpty) {
        result = operations.join();
        operationHistory = "";
      }
    }

    return Container(
      margin: AppSizes.getSymmetricPadding(0.05, 0.02),
      child: Stack(
        children: [
          CustomPaint(
            painter: ShadowCanvas(
              width: AppSizes.getWidth(0.9),
              height: AppSizes.getHeight(0.26),
              backgroundColor: Theme.of(context).colorScheme.shadow,
            ),
            child: Container(),
          ),
          CustomPaint(
            painter: ScreenCanvas(
              width: AppSizes.getWidth(0.9),
              height: AppSizes.getHeight(0.26),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
            ),
            child: Container(
              height: AppSizes.getHeight(0.26),
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: AppSizes.getHorizontalPadding(0.05).copyWith(
                        top: AppSizes.getHeight(0.02),
                        left: AppSizes.getWidth(0.06),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            operationHistory,
                            maxLines: 2,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: AppSizes.getWidth(0.05),
                                ),
                          ),
                          Text(
                            result,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  fontSize: result.length > 10
                                      ? AppSizes.getWidth(0.09)
                                      : AppSizes.getWidth(0.13),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: AppSizes.getHeight(0.02),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Container(
                    height: AppSizes.getHeight(0.02),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  )
                ],
              ),
            ),
          ),
          CustomPaint(
            painter: BorderCanvas(
              width: AppSizes.getWidth(0.9),
              height: AppSizes.getHeight(0.26),
              backgroundColor: Theme.of(context).colorScheme.shadow,
            ),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
