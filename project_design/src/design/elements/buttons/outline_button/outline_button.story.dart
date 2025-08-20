import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';
import '../../../../project_design_exports.dart';


//region Knobs
String textKnob(BuildContext context) => context.knobs.text(label: 'Button text', initial: 'START!');

bool iconKnob(BuildContext context) => context.knobs.boolean(label: 'Show icon', initial: false);

bool iconPositionKnob(BuildContext context) => context.knobs.boolean(label: 'Icon is leading', initial: true);

String textKnobOptions(BuildContext context) =>
    context.knobs.options(label: 'Button text', initial: 'START!!!', options: [
      const Option(label: "Zobrazit na mapě", value: "Zobrazit na mapě"),
      const Option(label: "Long text", value: "sdfjo489sf ufwjisd wj fkjsdf"),
    ]);

onTap() => debugPrint("Test click.");
//endregion

outlineButtonStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      OutlineButton(
        text: "Sdílet událost",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        leadingIcon: iconPositionKnob(context),
        size: ButtonSize.large,
      ),
      OutlineButton(
        text: "Zobrazit na mapě",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        leadingIcon: iconPositionKnob(context),
        size: ButtonSize.large,
      ),
      OutlineButton(
        text: "Zrušit účast",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        leadingIcon: iconPositionKnob(context),
        size: ButtonSize.large,
        style: OutlineButtonStyle(
          primaryColor: AppColors.red500,
          secondaryColor: AppColors.red100,
          iconColor: AppColors.red500,
          textColor: AppColors.red500,
        ),
      ),
      OutlineButton(
        text: "Poslat zprávu",
        onTap: onTap,
        icon: iconKnob(context) ? Icons.add : null,
        leadingIcon: iconPositionKnob(context),
        size: ButtonSize.small,
      ),
    ],
  );
}
