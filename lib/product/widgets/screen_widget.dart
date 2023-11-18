import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/app_sizes.dart';
import 'package:provider/provider.dart';

import '../../model/calculator_model.dart';
import '../canvas/_exports.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
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

    return Padding(
      padding: AppSizes.getHorizontalPadding(0.05).copyWith(top: 10),
      child: Stack(
        children: [
          CustomPaint(
            painter: ShadowCanvas(
                backgroundColor: Theme.of(context).colorScheme.shadow),
            child: Container(),
          ),
          CustomPaint(
            painter: ScreenCanvas(
                backgroundColor: Theme.of(context).colorScheme.onSurface),
            child: Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 22, 0),
                    child: Text(
                      operationHistory,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      result,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 16,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Container(
                    height: 16,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  )
                ],
              ),
            ),
          ),
          CustomPaint(
            painter: BorderCanvas(
                backgroundColor: Theme.of(context).colorScheme.shadow),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
