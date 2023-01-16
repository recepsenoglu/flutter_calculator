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
    path.moveTo(100, 10);
    path.lineTo(10, 100);
    path.lineTo(10, 240);
    path.lineTo(size.width, 240);
    path.lineTo(size.width, 10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
