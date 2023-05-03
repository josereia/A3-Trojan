import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:calculator/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(metrics.padding),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "0000",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              const Text("0000"),
            ],
          ),
        ),
        SizedBox(height: metrics.smallGap),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(metrics.smallPadding),
            child: LayoutGrid(
              areas: ''' 
                % ce c cls
                n n n /
                7 8 9 *
                4 5 6 -
                1 2 3 +
                +/- 0 , =
              ''',
              columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
              rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
              columnGap: metrics.smallGap,
              rowGap: metrics.smallGap,
              children: [
                ButtonWidget(
                  text: "%",
                  onPressed: () => {},
                ).inGridArea("%"),
                ButtonWidget(
                  text: "CE",
                  onPressed: () => {},
                ).inGridArea("ce"),
                ButtonWidget(
                  text: "C",
                  onPressed: () => {},
                ).inGridArea("c"),
                ButtonWidget(
                  text: "clear",
                  onPressed: () => {},
                ).inGridArea("cls"),
                ButtonWidget(
                  text: "/",
                  onPressed: () => {},
                ).inGridArea("/"),
                ButtonWidget(
                  text: "7",
                  onPressed: () => {},
                ).inGridArea("7"),
                ButtonWidget(
                  text: "8",
                  onPressed: () => {},
                ).inGridArea("8"),
                ButtonWidget(
                  text: "9",
                  onPressed: () => {},
                ).inGridArea("9"),
                ButtonWidget(
                  text: "*",
                  onPressed: () => {},
                ).inGridArea("*"),
                ButtonWidget(
                  text: "4",
                  onPressed: () => {},
                ).inGridArea("4"),
                ButtonWidget(
                  text: "5",
                  onPressed: () => {},
                ).inGridArea("5"),
                ButtonWidget(
                  text: "6",
                  onPressed: () => {},
                ).inGridArea("6"),
                ButtonWidget(
                  text: "-",
                  onPressed: () => {},
                ).inGridArea("-"),
                ButtonWidget(
                  text: "1",
                  onPressed: () => {},
                ).inGridArea("1"),
                ButtonWidget(
                  text: "2",
                  onPressed: () => {},
                ).inGridArea("2"),
                ButtonWidget(
                  text: "3",
                  onPressed: () => {},
                ).inGridArea("3"),
                ButtonWidget(
                  text: "+",
                  onPressed: () => {},
                ).inGridArea("+"),
                ButtonWidget(
                  text: "+/-",
                  onPressed: () => {},
                ).inGridArea("+/-"),
                ButtonWidget(
                  text: "0",
                  onPressed: () => {},
                ).inGridArea("0"),
                ButtonWidget(
                  text: ",",
                  onPressed: () => {},
                ).inGridArea(","),
                ButtonWidget(
                  text: "=",
                  color: ButtonWidgetColors.primary,
                  onPressed: () => {},
                ).inGridArea("="),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
