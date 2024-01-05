import 'package:flutter/material.dart';

class ShadowCanvas extends CustomPainter {
  ShadowCanvas({
    required this.width,
    required this.height,
    this.margin = 10,
    this.backgroundColor,
  });

  final double width;
  final double height;
  final double margin;
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
    path.moveTo(width / 5 + margin, margin);
    path.lineTo(margin, height / 3 + margin);
    path.lineTo(margin, height + margin);
    path.lineTo(width, height + margin);
    path.lineTo(width, margin);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
