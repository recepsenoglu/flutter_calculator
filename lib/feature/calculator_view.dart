import 'package:flutter/material.dart';
import 'package:flutter_calculator/feature/app_bar.dart';
import 'package:flutter_calculator/product/widgets/calculator_keypad.dart';
import '../product/widgets/screen_widget.dart';

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
