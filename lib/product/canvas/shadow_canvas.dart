import 'package:flutter/material.dart';

class ShadowCanvas extends CustomPainter {
  ShadowCanvas({
    this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        backgroundColor ?? Colors.black,
        backgroundColor ?? Colors.black
      ],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(100, 15);
    path.lineTo(15, 100);
    path.lineTo(15, 250);
    path.lineTo(size.width, 250);
    path.lineTo(size.width, 15);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
