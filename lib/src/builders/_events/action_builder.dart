
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';

class ActionBuilder {

  const ActionBuilder._();


  static void execute({
    required SingleFieldBloc fieldBloc,
    required Map<String, dynamic> actions,
    required FieldBlocState<dynamic, dynamic, dynamic> previous,
    required FieldBlocState<dynamic, dynamic, dynamic> current
  }) {

    // {name: action-test, attributes: [{name: attribute, if: [FormCraft.FormCraftInput] == 'some', expr: eval: [FormCraft.FormCraftInput765]}, {name: attribute, if: #{code == 'some'}, expr: #{ __self__.customer.fullName }}, {name: attribute, expr: call: com.axelor.contact.SomeController:method}, {name: attribute, expr: select: s.fullName from Contact s where s.code = :code}]}


    actions.forEach((key, value) {
      print("key: $key, value: $value");
      if (value is Map<String, dynamic>) {
        _executeAction(
          fieldBloc: fieldBloc,
          action: value,
          previous: previous,
          current: current
        );
      }
    });



  }


  static void _executeAction({
    required SingleFieldBloc fieldBloc,
    required Map<String, dynamic> action,
    required FieldBlocState<dynamic, dynamic, dynamic> previous,
    required FieldBlocState<dynamic, dynamic, dynamic> current
  }) {
    print("Action: $action");
    String name = ValueUtil.getAsString("name", action);
    List<Map<String, dynamic>> attributes = ValueUtil.getList("attributes", action);
    print("Name: $name, Attributes: $attributes");
    attributes.forEach((attribute) {
      print("Attribute: $attribute");
      _executeAttribute(
        fieldBloc: fieldBloc,
        attribute: attribute,
        previous: previous,
        current: current
      );
    });
  }


  static _executeAttribute({
    required SingleFieldBloc fieldBloc,
    required Map<String, dynamic> attribute,
    required FieldBlocState<dynamic, dynamic, dynamic> previous,
    required FieldBlocState<dynamic, dynamic, dynamic> current
  }) {
    print("Attribute: $attribute");
    String name = ValueUtil.getAsString("name", attribute);
    String? ifCondition = ValueUtil.getAsString("if", attribute);
    String? expr = ValueUtil.getAsString("expr", attribute);
    print("Name: $name, If: $ifCondition, Expr: $expr");


  }


}