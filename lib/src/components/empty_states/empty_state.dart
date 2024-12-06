import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pure_ui_kit/src/theme/pure_theme.dart';
import 'package:pure_ui_kit/src/utils/constants.dart';
import 'package:pure_ui_kit/src/utils/painters/dashed_border_painter.dart';

/// A widget that displays an empty state with various configurations.
///
/// This widget can be used to show a placeholder when there's no content,
/// or to create a call-to-action area.
class PureEmptyState extends StatelessWidget {
  /// The title text to display in the empty state.
  final String? title;

  /// Optional description text providing more context.
  final String? description;

  /// Text to display on the action button.
  final String? buttonText;

  /// Callback function when the empty state is pressed.
  final VoidCallback? onPressed;

  /// Custom icon widget to display instead of the default icon.
  final Widget? icon;

  /// Whether to show a dashed border around the empty state.
  final bool withDashedBorder;

  /// Creates a simple empty state with optional title, description, and action button.
  const PureEmptyState.simple({
    super.key,
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
    this.icon,
  }) : withDashedBorder = false;

  /// Creates an empty state with a dashed border, typically used for drop zones.
  const PureEmptyState.withDashedBorder({
    super.key,
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
    this.icon,
  }) : withDashedBorder = true;

  @override
  Widget build(BuildContext context) {
    if (withDashedBorder) {
      return _buildDashedBorderVersion(context);
    }
    return _buildSimpleVersion(context);
  }

  Widget _buildDashedBorderVersion(BuildContext context) {
    final theme = PureTheme.emptyStateThemeOf(context);

    return InkWell(
      onTap: onPressed,
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: theme.dashedBorderColor ?? Colors.grey.shade300,
          strokeWidth: theme.dashedBorderWidth ?? 2,
          borderRadius: theme.borderRadius ?? BorderRadius.circular(8),
        ),
        child: Container(
          padding: theme.padding ?? const EdgeInsets.all(48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ??
                  HeroIcon(
                    HeroIcons.plusCircle,
                    size: theme.iconSize ?? 40,
                    color: theme.iconColor ?? iconColor,
                  ),
              const SizedBox(height: 8),
              Text(
                title ?? '',
                style: theme.titleStyle ??
                    const TextStyle(
                      fontFamily: 'inter',
                      color: gray900,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleVersion(BuildContext context) {
    final theme = PureTheme.emptyStateThemeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ??
            HeroIcon(
              HeroIcons.folderPlus,
              size: theme.iconSize ?? 40,
              color: theme.iconColor ?? iconColor,
            ),
        const SizedBox(height: 8),
        if (title != null)
          Text(
            title!,
            style: theme.titleStyle ??
                const TextStyle(
                  fontFamily: 'inter',
                  color: gray900,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              description!,
              style: theme.descriptionStyle ??
                  const TextStyle(
                    fontFamily: 'inter',
                    color: gray500,
                    fontSize: textSm,
                  ),
            ),
          ),
        if (buttonText != null)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.add, size: 20),
              label: Text(
                buttonText!,
              ),
              style: theme.buttonStyle ??
                  ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'inter',
                      fontSize: textSm,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
      ],
    );
  }
}
