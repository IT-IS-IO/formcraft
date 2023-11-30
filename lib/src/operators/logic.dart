

import 'package:formcraft/src/components/interfaces/component_interface.dart';
import 'package:formcraft/src/components/interfaces/field_interface.dart';
import 'package:formcraft/src/other/typedefs/typedefs.dart';
import 'package:formcraft/src/providers/storage.dart';


class Logic {


  Logic(this.component, this.logic) {

    for (var element in logic) {

      if (element.containsKey("trigger")) {
        if (element["trigger"]["type"] == "simple") {
          if (element["trigger"]["simple"]["show"] == true) {

            String uuid = element["trigger"]["simple"]["when"];

            Component? component = _getFieldsFromStorage(uuid);

            if (component != null && component is FieldComponent) {
              _listenables.add({
                "uuid": uuid,
                "component": component,
                "eq": element["trigger"]["simple"]["eq"],
              });
            }

          }
        }
      }

    }

    component.listener
      ..subscribeToFieldBlocs(listenableFields)
      ..updateValidators([_action]);



  }


  final Component component;


  final List<Map<String, dynamic>> logic;


  final List<Map<String, dynamic>> _listenables = [];


  List<FieldComponent> get listenableComponents => _listenables.map((_) => _["component"]).toList().whereType<FieldComponent>().toList();


  List<ListenOperator> get listenableFields => listenableComponents.map((e) => e.listener).toList();


  bool evaluate() {

    List<bool> results = [];

    for (Map<String, dynamic> field in _listenables) {

      if (field["component"] is FieldComponent) {

        FieldComponent component = field["component"];

        if (component.value == field["eq"]) {
          results.add(true);
        }

      }

    }

    if (results.isEmpty) return false;

    return results.every((element) => element == true);

  }


  void _action(value) {

    component.visible = evaluate();

    evaluateJsRaw();

  }


  bool evaluateJsRaw() {

    return false;
  }


  Component? _getFieldsFromStorage(String key) {
    // TODO: Check if the field has same logic
    // if (subscribeToFields.any((_) => _["uuid"] == key)) return null;
    return StorageProvider.instance.getComponent(key);
  }


}

