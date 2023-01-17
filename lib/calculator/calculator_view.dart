import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator/app_bar.dart';
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
    return Scaffold(
      appBar: const CalculatorAppBar(),
      body: Column(
        children: const [
          Spacer(),
          ScreenWidget(),
          Spacer(),
          CalculatorKeypad(),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
