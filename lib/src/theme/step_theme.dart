import 'package:flutter/material.dart';
import 'package:pure_ui_kit/src/utils/constants.dart';

class PureStepTheme {
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? completedColor;
  final double? lineWidth;
  final double? lineHeight;
  final double? circleSize;
  final double? dotSize;
  final TextStyle? labelStyle;
  final double? spacing;

  const PureStepTheme({
    this.activeColor,
    this.inactiveColor,
    this.completedColor,
    this.lineWidth,
    this.lineHeight,
    this.circleSize,
    this.dotSize,
    this.labelStyle,
    this.spacing,
  });

  static const PureStepTheme defaultTheme = PureStepTheme(
    activeColor: primary,
    inactiveColor: Colors.grey,
    completedColor: primary,
    lineWidth: 60,
    lineHeight: 1.5,
    circleSize: 24,
    dotSize: 6,
    spacing: 8,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  PureStepTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? completedColor,
    double? lineWidth,
    double? lineHeight,
    double? circleSize,
    double? dotSize,
    TextStyle? labelStyle,
    double? spacing,
  }) {
    return PureStepTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      completedColor: completedColor ?? this.completedColor,
      lineWidth: lineWidth ?? this.lineWidth,
      lineHeight: lineHeight ?? this.lineHeight,
      circleSize: circleSize ?? this.circleSize,
      dotSize: dotSize ?? this.dotSize,
      labelStyle: labelStyle ?? this.labelStyle,
      spacing: spacing ?? this.spacing,
    );
  }
}
