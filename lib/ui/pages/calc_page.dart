import 'package:calculator/controllers/calc_page_controller.dart';
import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:calculator/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class _DisplayWidget extends GetView<CalcPageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(metrics.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Obx(
            () => Text(
              controller.getEquationFieldText,
              style: theme.textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: metrics.gap),
          Obx(
            () => Text(controller.getResultFieldText),
          ),
        ],
      ),
    );
  }
}

class _KeyboardWidget extends GetView<CalcPageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return LayoutGrid(
      areas: ''' 
        c    cls    %    /
        7     8     9    x
        4     5     6    -
        1     2     3    +
        +/-   0     ,    =
      ''',
      columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
      rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
      columnGap: metrics.smallGap,
      rowGap: metrics.smallGap,
      children: [
        ButtonWidget(
          text: "C",
          onPressed: () => controller.clear(),
        ).inGridArea("c"),
        ButtonWidget(
          icon: Ionicons.backspace_outline,
          onPressed: () => controller.delete(),
        ).inGridArea("cls"),
        ButtonWidget(
          text: "",
          onPressed: () => controller.onKeyboardPressed(""),
        ).inGridArea("%"),
        ButtonWidget(
          text: "/",
          onPressed: () => controller.onKeyboardPressed("/"),
        ).inGridArea("/"),
        ButtonWidget(
          text: "7",
          onPressed: () => controller.onKeyboardPressed("7"),
        ).inGridArea("7"),
        ButtonWidget(
          text: "8",
          onPressed: () => controller.onKeyboardPressed("8"),
        ).inGridArea("8"),
        ButtonWidget(
          text: "9",
          onPressed: () => controller.onKeyboardPressed("9"),
        ).inGridArea("9"),
        ButtonWidget(
          text: "x",
          onPressed: () => controller.onKeyboardPressed("x"),
        ).inGridArea("x"),
        ButtonWidget(
          text: "4",
          onPressed: () => controller.onKeyboardPressed("4"),
        ).inGridArea("4"),
        ButtonWidget(
          text: "5",
          onPressed: () => controller.onKeyboardPressed("5"),
        ).inGridArea("5"),
        ButtonWidget(
          text: "6",
          onPressed: () => controller.onKeyboardPressed("6"),
        ).inGridArea("6"),
        ButtonWidget(
          text: "-",
          onPressed: () => controller.onKeyboardPressed("-"),
        ).inGridArea("-"),
        ButtonWidget(
          text: "1",
          onPressed: () => controller.onKeyboardPressed("1"),
        ).inGridArea("1"),
        ButtonWidget(
          text: "2",
          onPressed: () => controller.onKeyboardPressed("2"),
        ).inGridArea("2"),
        ButtonWidget(
          text: "3",
          onPressed: () => controller.onKeyboardPressed("3"),
        ).inGridArea("3"),
        ButtonWidget(
          text: "+",
          onPressed: () => controller.onKeyboardPressed("+"),
        ).inGridArea("+"),
        ButtonWidget(
          text: "",
          onPressed: () => controller.onKeyboardPressed(""),
        ).inGridArea("+/-"),
        ButtonWidget(
          text: "0",
          onPressed: () => controller.onKeyboardPressed("0"),
        ).inGridArea("0"),
        ButtonWidget(
          text: ",",
          onPressed: () => controller.onKeyboardPressed(","),
        ).inGridArea(","),
        ButtonWidget(
          text: "=",
          color: ButtonWidgetColors.primary,
          onPressed: () => controller.equal(),
        ).inGridArea("="),
      ],
    );
  }
}

class CalcPage extends GetView<CalcPageController> {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: _DisplayWidget()),
        SizedBox(height: metrics.smallGap),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(metrics.smallPadding),
            child: _KeyboardWidget(),
          ),
        ),
      ],
    );
  }
}
