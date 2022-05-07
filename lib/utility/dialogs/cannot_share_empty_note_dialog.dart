import 'package:flutter/widgets.dart';
import 'package:mynotes/utility/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: "Sharing",
    content: "You cannot share an empthy Note",
    optionBuilder: () {
      return {
        'Ok': null,
      };
    },
  );
}
