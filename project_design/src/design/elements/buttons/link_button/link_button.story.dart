import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import '../../../../project_design_exports.dart';


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

linkButtonStory(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 30,
    children: [
      LinkButton(text: "Přidat další informace", onTap: onTap),
      LinkButton(
        text: "Resetovat vše",
        onTap: onTap,
        textStyle: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.textStyle.copyWith(fontSize: 14),
      ),
      LinkButton(
        text: "Přidat událost",
        onTap: onTap,
        icon: Icon(iconKnob(context) ? Icons.add : null, color: AppColors.blue900, size: 20),
        leadingIcon: true,
      ),
      LinkButton(
        text: "Detail",
        onTap: onTap,
        leadingIcon: false,
        icon: Icon(iconKnob(context) ? CupertinoIcons.chevron_right : null, color: AppColors.black, size: 20),
        style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(
          textStyle: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.textStyle.copyWith(
            fontSize: 13,
            color: AppColors.grey400,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      LinkButton(
        text: "Upravit",
        onTap: onTap,
        icon: Icon(iconKnob(context) ? Icons.add : null, color: AppColors.blue900, size: 12),
        textStyle: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.textStyle.copyWith(fontSize: 12),
      ),
    ],
  );
}
