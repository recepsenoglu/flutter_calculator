import 'package:flutter/material.dart';

import '../product/widgets/calculator_keypad.dart';
import '../product/widgets/screen_widget.dart';
import 'app_bar.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CalculatorAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ScreenWidget(),
          CalculatorKeypad(),
        ],
      ),
    );
  }
}
