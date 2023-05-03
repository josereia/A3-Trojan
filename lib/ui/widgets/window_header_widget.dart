import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class WindowHeaderWidget extends StatelessWidget {
  const WindowHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return WindowTitleBarBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: MoveWindow()),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: metrics.borderRadius,
            ),
            child: BackdropFilter(
              blendMode: BlendMode.src,
              filter: ImageFilter.blur(
                sigmaX: metrics.blurAmount,
                sigmaY: metrics.blurAmount,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: metrics.borderRadius,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MinimizeWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        normal: colors.background,
                        iconNormal: colors.onBackground,
                      ),
                    ),
                    MaximizeWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        normal: colors.background,
                        iconNormal: colors.onBackground,
                      ),
                    ),
                    CloseWindowButton(
                      animate: true,
                      colors: WindowButtonColors(
                        normal: colors.background,
                        iconNormal: colors.onBackground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
