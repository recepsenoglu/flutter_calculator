import 'package:flutter/material.dart';

import '../../constant/calculator_keys.dart';
import '../../utils/action_maker.dart';
import '../../utils/app_sizes.dart';

class CalculatorButton extends StatefulWidget {
  final String label;
  final KeyType keyType;

  const CalculatorButton(
      {super.key, required this.label, required this.keyType});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  Color? labelColor;
  bool isPressing = false;

  void updateIsPressing(bool value) {
    if (isPressing == value) return;
    setState(() {
      isPressing = value;
    });
  }

  @override
  void initState() {
    super.initState();
    labelColor = widget.keyType == KeyType.helper || widget.label == "%"
        ? const Color(0xFF75C0D0)
        : widget.keyType == KeyType.operator
            ? const Color(0xFFEBB04F)
            : null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ActionMaker.keyPressed(context, widget.label, widget.keyType),
      onTapDown: (details) => updateIsPressing(true),
      onTapUp: (details) => updateIsPressing(false),
      onTapCancel: () => updateIsPressing(false),
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 4, left: 4),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.shadow,
              borderRadius: BorderRadius.circular(14)),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: isPressing
              ? const EdgeInsets.only(top: 4, left: 4)
              : const EdgeInsets.only(bottom: 4, right: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            border: Border.all(
                color: Theme.of(context).colorScheme.shadow, width: 3.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: labelColor, fontSize: AppSizes.getWidth(0.08)),
            ),
          ),
        ),
      ]),
    );
  }
}
