import 'package:flutter/material.dart';

class PureEmptyStateTheme {
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final ButtonStyle? buttonStyle;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsets? padding;
  final Color? dashedBorderColor;
  final double? dashedBorderWidth;
  final BorderRadius? borderRadius;

  const PureEmptyStateTheme({
    this.titleStyle,
    this.descriptionStyle,
    this.buttonStyle,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.dashedBorderColor,
    this.borderRadius,
    this.dashedBorderWidth,
  });

  // Thème par défaut
  static const PureEmptyStateTheme defaultTheme = PureEmptyStateTheme(
    titleStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    descriptionStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
    iconColor: Colors.grey,
    iconSize: 48,
    padding: EdgeInsets.all(48),
    dashedBorderColor: Colors.grey,
    dashedBorderWidth: 2,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  PureEmptyStateTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    ButtonStyle? buttonStyle,
    Color? iconColor,
    double? iconSize,
    EdgeInsets? padding,
    Color? dashedBorderColor,
    double? dashedBorderWidth,
    BorderRadius? borderRadius,
  }) {
    return PureEmptyStateTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      dashedBorderColor: dashedBorderColor ?? this.dashedBorderColor,
      dashedBorderWidth: dashedBorderWidth ?? this.dashedBorderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
