import 'package:flutter/material.dart';
import '../../utils/action_maker.dart';
import '../../constant/calculator_keys.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final KeyType keyType;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.keyType,
  });

  Color? get getLabelColor => keyType == KeyType.helper || label == "%"
      ? const Color(0xFF75C0D0)
      : keyType == KeyType.operator
          ? const Color(0xFFEBB04F)
          : null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ActionMaker.keyPressed(context, label, keyType),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: 4, left: 4),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.shadow,
                borderRadius: BorderRadius.circular(14)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 4, right: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              border: Border.all(
                  color: Theme.of(context).colorScheme.shadow, width: 3.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: getLabelColor),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
