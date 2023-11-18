import 'package:flutter/material.dart';

class AppSizes {
  static late double _screenWidth;
  static late double _screenHeight;
  static late EdgeInsets _padding;
  static late bool _isPortrait;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    _screenWidth = size.width;
    _screenHeight = size.height;

    _isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ||
        _screenWidth < _screenHeight;

    _padding = MediaQuery.paddingOf(context);
  }

  static double get width => _screenWidth;
  static double get height => _screenHeight;
  static double get bottomPadding => _padding.bottom;
  static double get topPadding => _padding.top;
  static Size get screenSize => Size(_screenWidth, _screenHeight);
  static bool get isPortrait => _isPortrait;
  static double get aspectRatio => _screenWidth / _screenHeight;
  static bool get isBigAspectRatio => aspectRatio > 0.5;

  static double getWidth(double percent) {
    return _screenWidth * percent;
  }

  static double getHeight(double percent) {
    return _screenHeight * percent;
  }

  static EdgeInsets getPadding(double percent) {
    return EdgeInsets.all(getWidth(percent));
  }

  static EdgeInsets getHorizontalPadding(double percent) {
    return EdgeInsets.symmetric(horizontal: getWidth(percent));
  }

  static EdgeInsets getVerticalPadding(double percent) {
    return EdgeInsets.symmetric(vertical: getHeight(percent));
  }

  static EdgeInsets getSymmetricPadding(double horizontal, double vertical) {
    return EdgeInsets.symmetric(
      horizontal: getWidth(horizontal),
      vertical: getHeight(vertical),
    );
  }
}
