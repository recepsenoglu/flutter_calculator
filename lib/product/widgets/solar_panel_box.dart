import 'package:flutter/material.dart';

class SolarPanelBox extends StatelessWidget {
  const SolarPanelBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Stack(
        children: [
          Container(
            width: 21,
            height: 21,
            margin: const EdgeInsets.only(left: 2.5, top: 2.5),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.outline),
          ),
          Container(
            width: 21,
            height: 21,
            margin: const EdgeInsets.only(right: 2.5, bottom: 2.5),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    color: Theme.of(context).colorScheme.outline, width: 2),
                borderRadius: BorderRadius.circular(1)),
          ),
        ],
      ),
    );
  }
}
