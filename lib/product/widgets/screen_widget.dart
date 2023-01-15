import 'package:flutter/material.dart';
import 'package:flutter_calculator/model/calculator_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Stack(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5, left: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black, width: 6),
            ),
          ),
          Container(
            height: 240,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    Provider.of<CalculatorModel>(context).operationHistory,
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    Provider.of<CalculatorModel>(context).result,
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 16,
                  color: const Color(0xFFDCEDF0),
                ),
                Container(
                  height: 16,
                  color: const Color(0xFFF9E9CF),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
