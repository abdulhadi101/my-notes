import 'package:flutter/material.dart';
import 'package:mynotes/utility/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
      context: context,
      title: "An error Occurred",
      content: text,
      optionBuilder: () {
        return {
          'OK': null,
        };
      });
}
