
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';
import 'package:formcraft/src/managers/StateManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';



class FunctionBuilder {


  static Function() build({ required Map<String, dynamic> data }) {

    switch (MapManager.getAsString("method", data)) {
      case "submit": return _submit(data: data);
      case "modal": return _modal(data: data);
      default: return _debugPrint();
    }

  }


  static Function() _submit({ required Map<String, dynamic> data }) {
    return () => print("Debug Print");
  }


  static Function() _modal({ required Map<String, dynamic> data }) {
    return () async {

      print("Modal Opened");

      print(data);

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