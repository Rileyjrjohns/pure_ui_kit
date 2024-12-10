import 'package:flutter/material.dart';
import 'package:pure_ui_kit/src/theme/empty_state_theme.dart';
import 'package:pure_ui_kit/src/theme/step_theme.dart';

class PureTheme extends InheritedWidget {
  final PureEmptyStateTheme emptyStateTheme;
  final PureStepTheme stepTheme;

  const PureTheme({
    super.key,
    required super.child,
    this.emptyStateTheme = const PureEmptyStateTheme(),
    this.stepTheme = const PureStepTheme(),
  });

  static PureTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PureTheme>();
  }

  static PureEmptyStateTheme emptyStateThemeOf(BuildContext context) {
    final theme = maybeOf(context)?.emptyStateTheme;
    return theme ?? PureEmptyStateTheme.defaultTheme;
  }

  static PureStepTheme stepThemeOf(BuildContext context) {
    final theme = maybeOf(context)?.stepTheme;
    return theme ?? PureStepTheme.defaultTheme;
  }

  @override
  bool updateShouldNotify(PureTheme oldWidget) {
    return emptyStateTheme != oldWidget.emptyStateTheme || stepTheme != oldWidget.stepTheme;
  }
}
