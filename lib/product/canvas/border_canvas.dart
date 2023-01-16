import 'package:flutter/material.dart';

class BorderCanvas extends CustomPainter {
  BorderCanvas({
    this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black, Colors.black],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()
      ..shader = gradient.createShader(colorBounds)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    Path path = Path();
    path.moveTo(75, 0);
    path.lineTo(0, 65);
    path.lineTo(0, 240);
    path.lineTo(size.width - 10, 240);
    path.lineTo(size.width - 10, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
