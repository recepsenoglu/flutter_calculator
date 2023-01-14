import 'package:flutter/material.dart';

class SolarPanelBox extends StatelessWidget {
  const SolarPanelBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Stack(
        children: [
          Container(
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(left: 3, top: 3),
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Container(
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(right: 3, bottom: 3),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(2)),
          ),
        ],
      ),
    );
  }
}
