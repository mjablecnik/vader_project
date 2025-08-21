import 'package:flutter/material.dart';
import '../../../project_design_exports.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

//region Knobs
String titleTextKnobOptions(BuildContext context) => context.knobs.options(
  label: 'Title text',
  initial: 'Title text',
  options: [
    const Option(label: "Short text", value: "Short text"),
    const Option(label: "Long text", value: "Vítejte zde na našich stránkách."),
  ],
);

String contentTextKnobOptions(BuildContext context) => context.knobs.options(
  label: 'Content text',
  initial: 'Content text',
  options: [
    const Option(label: "Short text", value: "Krátký text"),
    const Option(label: "Long text", value: "Vítejte zde na našich stránkách."),
  ],
);

onTap() => debugPrint("Test click.");
//endregion

dialogQuestionStory(BuildContext context) {
  return DialogQuestion(title: titleTextKnobOptions(context), content: contentTextKnobOptions(context));
}
