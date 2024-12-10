import 'package:flutter/material.dart';
import 'package:pure_ui_kit/src/theme/pure_theme.dart';
import 'package:pure_ui_kit/src/theme/step_theme.dart';

enum StepType {
  bullet,
  circle,
  progressBar,
}

enum StepStatus {
  completed,
  current,
  upcoming,
}

class PureStep extends StatelessWidget {
  final StepType type;
  final int currentStep;
  final int totalSteps;
  final List<String> labels;
  final Function(int)? onStepTap;
  final String? progressLabel;
  final double? progressValue;

  const PureStep.bullet({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onStepTap,
  })  : type = StepType.bullet,
        labels = const [],
        progressLabel = null,
        progressValue = null;

  const PureStep.circle({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onStepTap,
  })  : type = StepType.circle,
        labels = const [],
        progressLabel = null,
        progressValue = null;

  const PureStep.progressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.progressLabel,
    this.onStepTap,
  })  : type = StepType.progressBar,
        labels = const [],
        progressValue = currentStep / totalSteps;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case StepType.bullet:
        return _buildBulletStep();
      case StepType.circle:
        return _buildCircleStep();
      case StepType.progressBar:
        return _buildProgressBar();
    }
  }

  Widget _buildBulletStep() {
    return Builder(builder: (context) {
      final theme = PureTheme.stepThemeOf(context);
      const defaultTheme = PureStepTheme.defaultTheme;

      final activeColor = theme.activeColor ?? defaultTheme.activeColor!;
      final inactiveColor = theme.inactiveColor ?? defaultTheme.inactiveColor!;
      final dotSize = theme.dotSize ?? defaultTheme.dotSize!;
      final labelStyle = theme.labelStyle ?? defaultTheme.labelStyle!;
      final spacing = theme.spacing ?? defaultTheme.spacing!;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Step $currentStep of $totalSteps',
            style: labelStyle,
          ),
          SizedBox(width: spacing * 4),
          Row(
            children: List.generate(
              totalSteps,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing),
                child: _buildBulletDot(
                  index,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                  dotSize: dotSize,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildBulletDot(
    int index, {
    required Color activeColor,
    required Color inactiveColor,
    required double dotSize,
  }) {
    final isCompleted = index < currentStep - 1;
    final isCurrent = index == currentStep - 1;

    return GestureDetector(
      onTap: () => onStepTap?.call(index + 1),
      child: isCurrent
          ? _buildCurrentBullet(
              activeColor: activeColor,
              dotSize: dotSize,
            )
          : Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? activeColor : inactiveColor,
              ),
            ),
    );
  }

  Widget _buildCurrentBullet({
    required Color activeColor,
    required double dotSize,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: dotSize * 2,
          height: dotSize * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(
              activeColor.red,
              activeColor.green,
              activeColor.blue,
              0.2,
            ),
          ),
        ),
        Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCircleStep() {
    return Builder(builder: (context) {
      final theme = PureTheme.stepThemeOf(context);
      const defaultTheme = PureStepTheme.defaultTheme;

      final circleSize = theme.circleSize ?? defaultTheme.circleSize!;
      final lineWidth = theme.lineWidth ?? defaultTheme.lineWidth!;
      final lineHeight = theme.lineHeight ?? defaultTheme.lineHeight!;
      final dotSize = theme.dotSize ?? defaultTheme.dotSize!;
      final activeColor = theme.activeColor ?? defaultTheme.activeColor!;
      final inactiveColor = theme.inactiveColor ?? defaultTheme.inactiveColor!;
      final completedColor = theme.completedColor ?? defaultTheme.completedColor!;

      return SizedBox(
        height: circleSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalSteps * 2 - 1,
            (index) {
              final isLine = index.isOdd;
              final stepIndex = index ~/ 2;
              final isCompleted = stepIndex < currentStep - 1;
              final isCurrent = stepIndex == currentStep - 1;

              if (isLine) {
                return Container(
                  width: lineWidth,
                  height: lineHeight,
                  color: isCompleted ? completedColor : inactiveColor,
                );
              } else {
                return Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isCurrent
                        ? Border.all(color: activeColor, width: lineHeight)
                        : (!isCompleted ? Border.all(color: inactiveColor, width: lineHeight) : null),
                    color: isCompleted ? completedColor : Colors.white,
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, size: circleSize * 0.6, color: Colors.white)
                      : isCurrent
                          ? Center(
                              child: Container(
                                width: dotSize,
                                height: dotSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: activeColor,
                                ),
                              ),
                            )
                          : null,
                );
              }
            },
          ),
        ),
      );
    });
  }

  Widget _buildProgressBar() {
    return Builder(builder: (context) {
      final theme = PureTheme.stepThemeOf(context);
      const defaultTheme = PureStepTheme.defaultTheme;

      final activeColor = theme.activeColor ?? defaultTheme.activeColor!;
      final inactiveColor = theme.inactiveColor ?? defaultTheme.inactiveColor!;
      final labelStyle = theme.labelStyle ?? defaultTheme.labelStyle!;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (progressLabel != null)
            Text(
              progressLabel!,
              style: labelStyle,
            ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: inactiveColor,
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progressValue ?? 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: activeColor,
                ),
              ),
            ),
          ),
          if (labels.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: labels
                    .asMap()
                    .entries
                    .map(
                      (entry) => Text(
                        entry.value,
                        style: labelStyle.copyWith(
                          color: entry.key < currentStep ? activeColor : inactiveColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      );
    });
  }
}
