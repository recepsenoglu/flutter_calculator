import 'package:flutter/material.dart';
import 'package:flutter_calculator/product/widgets/calculator_keypad.dart';
import 'package:google_fonts/google_fonts.dart';

import '../product/widgets/screen_widget.dart';
import '../product/widgets/solar_panel_box.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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

  AppBar _appBar() {
    const String strCasio = "CASIO";
    const String strCalculator = "CALCULATOR";

    return AppBar(
      centerTitle: false,
      toolbarHeight: 52,
      titleSpacing: 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            strCasio,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.michroma().fontFamily,
              letterSpacing: 4,
              fontSize: 20,
            ),
          ),
          Text(
            strCalculator,
            style: TextStyle(
              color: const Color(0xFFA8A8A8),
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 13,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                ...List.generate(4, (index) => const SolarPanelBox()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
