import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:flutter/material.dart';

enum ButtonWidgetColors {
  primary,
  secondary,
}

class ButtonWidget extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final Function()? onPressed;
  final ButtonWidgetColors? color;

  const ButtonWidget({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.color,
  });

  @override
  State<StatefulWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  double scale = 1;

  void onTapUp(TapUpDetails details) {
    setState(() {
      scale = 1;
    });
  }

  void onTapDown(TapDownDetails details) {
    setState(() {
      scale = 0.9;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    late Color backgroundColor;
    late Color foregroundColor;

    switch (widget.color) {
      case ButtonWidgetColors.primary:
        backgroundColor = colors.primary;
        foregroundColor = colors.onPrimary;
        break;
      case ButtonWidgetColors.secondary:
        backgroundColor = colors.secondary;
        foregroundColor = colors.onSecondary;
        break;
      default:
        backgroundColor = colors.secondary;
        foregroundColor = colors.onSecondary;
    }

    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 60),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTapUp: onTapUp,
          onTapDown: onTapDown,
          onTap: widget.onPressed,
          splashColor: colors.primary,
          hoverColor: colors.primary,
          highlightColor: colors.primary,
          borderRadius: BorderRadius.all(metrics.borderRadius),
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(metrics.borderRadius),
              border: Border.all(
                color: colors.border,
                width: metrics.borderWidth,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.text != null,
                    child: Text(
                      widget.text ?? "",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: foregroundColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.icon != null,
                    child: Icon(
                      widget.icon,
                      color: colors.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
