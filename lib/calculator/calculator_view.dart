import 'package:flutter/material.dart';
import 'package:flutter_calculator/product/widgets/solar_panel_box.dart';
import 'package:google_fonts/google_fonts.dart';

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
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: false,
      toolbarHeight: 52,
      titleSpacing: 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "CASIO",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.michroma().fontFamily,
              letterSpacing: 4,
              fontSize: 20,
            ),
          ),
          Text(
            "CALCULATOR",
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
