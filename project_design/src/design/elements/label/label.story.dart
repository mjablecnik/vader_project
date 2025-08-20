import 'package:flutter/material.dart';
import '../../../project_design_exports.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';


//region Knobs
String textKnob(BuildContext context) => context.knobs.text(label: 'Button text', initial: 'Default text');

bool iconKnob(BuildContext context) => context.knobs.boolean(label: 'Show icon', initial: false);

String textKnobOptions(BuildContext context) => context.knobs.options(
      label: 'Button text',
      initial: 'Default text',
      options: [
        const Option(label: "Short text", value: "Short text"),
        const Option(label: "Long text", value: "Vítejte zde na našich stránkách."),
      ],
    );

onTap() => debugPrint("Test click.");
//endregion

labelStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      Label(text: "Label without icon"),
      Label(icon: AppIcons.calendar.svg, text: "12.prosince 2025"),
      Label(icon: AppIcons.clock.svg, text: "Od 19:00 do 1:00"),
      Label(icon: AppIcons.point.svg, text: "Café Bar Maracas\nNekázanka 883/8, 110 00 Praha, Česko"),
    ],
  );
}
