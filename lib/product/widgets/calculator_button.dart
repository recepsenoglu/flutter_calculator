import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Color get getLabelColor => keyType == KeyType.helper || label == "%"
      ? const Color(0xFF75C0D0)
      : keyType == KeyType.operator
          ? const Color(0xFFEBB04F)
          : Colors.black;

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
                color: Colors.black, borderRadius: BorderRadius.circular(14)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 4, right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 4.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 34,
                  color: getLabelColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
