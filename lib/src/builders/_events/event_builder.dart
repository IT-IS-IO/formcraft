import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';
import 'package:formcraft/src/managers/StateManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';


class EventBuilder {

  const EventBuilder._();

  static Function() build({ required Map<String, dynamic> data }) {

    return switch (ValueUtil.getAsString("event", data)) {
      "submit" => _submit(data: data),
      "modal" => _modal(data: data),
      "debug" => _debugPrint(),
      _ => _debugPrint(),
    };

  }


  static Function() _submit({ required Map<String, dynamic> data }) {
    return () => print("Debug Print");
  }


  static Function() _modal({ required Map<String, dynamic> data }) {
    return () async {

      if (isNull(StateManager.context)) return;

      await showCupertinoDialog(
        context: StateManager.context!,
        useRootNavigator: true,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Material(
              color: Colors.transparent,
              child: FormCraftBuilder.build(data: data["widget"] ?? { }),
            )
          );
        }
      );

    };
  }


  static Function() _debugPrint() => () => print("Debug Print");


}