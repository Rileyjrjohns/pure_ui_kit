import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pure_ui_kit/src/theme/pure_theme.dart';
import 'package:pure_ui_kit/src/utils/constants.dart';
import 'package:pure_ui_kit/src/utils/painters/dashed_border_painter.dart';

class PureEmptyState extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool withDashedBorder;

  const PureEmptyState.simple({
    super.key,
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
    this.icon,
  }) : withDashedBorder = false;

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
