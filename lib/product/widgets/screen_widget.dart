import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/calculator_model.dart';
import '../canvas/_exports.dart';

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
      if (result.isEmpty) {
        result = operations.join();
        operationHistory = "";
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Stack(
        children: [
          CustomPaint(
            painter: ShadowCanvas(),
            child: Container(),
          ),
          CustomPaint(
            painter: ScreenCanvas(),
            child: Container(
              height: 230,
              margin: const EdgeInsets.only(bottom: 10, right: 10),
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
                      style: TextStyle(
                        fontSize: 26,
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
                        fontSize: 54,
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
          ),
          CustomPaint(
            painter: BorderCanvas(),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
