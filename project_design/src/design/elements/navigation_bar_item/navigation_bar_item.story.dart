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

onTap(int index) => debugPrint("Test click.");
//endregion


navigationBarItemStory(BuildContext context) {
  return NavigationBarItem(
    index: 0,
    icon: Icons.home,
    onTap: onTap,
  );
}
