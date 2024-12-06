import 'package:flutter/material.dart';
import 'package:pure_ui_kit/src/theme/empty_state_theme.dart';

class PureTheme extends InheritedWidget {
  final PureEmptyStateTheme emptyStateTheme;

  const PureTheme({
    super.key,
    required super.child,
    this.emptyStateTheme = const PureEmptyStateTheme(),
  });

  static PureTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PureTheme>();
  }

  static PureEmptyStateTheme emptyStateThemeOf(BuildContext context) {
    final theme = maybeOf(context)?.emptyStateTheme;
    return theme ?? PureEmptyStateTheme.defaultTheme;
  }

  @override
  bool updateShouldNotify(PureTheme oldWidget) {
    return emptyStateTheme != oldWidget.emptyStateTheme;
  }
}
