import 'package:flutter/material.dart';

class BorderCanvas extends CustomPainter {
  BorderCanvas({
    required this.width,
    required this.height,
    this.margin = 10,
    this.backgroundColor = Colors.black,
  });

  final double width;
  final double height;
  final double margin;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [backgroundColor, backgroundColor],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()
      ..shader = gradient.createShader(colorBounds)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    Path path = Path();
    path.moveTo(width / 5, 0);
    path.lineTo(0, height / 3);
    path.lineTo(0, height);
    path.lineTo(width - margin, height);
    path.lineTo(width - margin, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
