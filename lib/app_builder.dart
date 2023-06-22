import 'dart:io';

import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:calculator/ui/widgets/window_header_widget.dart';
import 'package:flutter/material.dart';

class AppBuilder extends StatelessWidget {
  final Widget? child;

  const AppBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: colors.background,
              child: child,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child:
                Platform.isWindows ? const WindowHeaderWidget() : Container(),
          ),
        ],
      ),
    );
  }
}
