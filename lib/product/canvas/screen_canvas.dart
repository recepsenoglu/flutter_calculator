import 'package:flutter/material.dart';

class ScreenCanvas extends CustomPainter {
  ScreenCanvas({
    this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        backgroundColor ?? Colors.white,
        backgroundColor ?? Colors.white
      ],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()
      ..shader = gradient.createShader(colorBounds)
      ..strokeWidth = 5;

    Path path = Path();
    path.moveTo(75, 0);
    path.lineTo(0, 65);
    path.lineTo(0, 210);
    path.lineTo(size.width - 10, 210);
    path.lineTo(size.width - 10, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
