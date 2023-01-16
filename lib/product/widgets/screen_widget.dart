import 'package:flutter/material.dart';
import 'package:flutter_calculator/model/calculator_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      result = operations.join();
      operationHistory = "";
    }

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
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    operationHistory,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    result,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 58,
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
