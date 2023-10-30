
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/builders/_functions/action_builder.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';
import 'package:formcraft/src/managers/StateManager.dart';


class FieldBuilder {


  static Widget build(Map<String, dynamic> data) {

    SingleFieldBloc fieldBloc = _buildFieldBloc(data: data);

    StateManager.addFieldBloc(
      key: ValueUtil.getAsString("form", data),
      step: ValueUtil.tryGetInt("step", data),
      field: fieldBloc,
    );

    if (data.containsKey("actions")) {

      Map<String, dynamic> actions = StateManager.getActions(data);

      if (actions.isNotEmpty) {
        fieldBloc.onValueChanges(onData: (_, __) async* {
          ActionBuilder.execute(
            fieldBloc: fieldBloc,
            actions: actions,
            previous: _,
            current: __,
          );
        });
      }

    }

    return _buildFieldWidget(data: data, fieldBloc: fieldBloc);

  }


  static Widget _buildFieldWidget({ required Map<String, dynamic> data, required SingleFieldBloc fieldBloc}) {

    String type = ValueUtil.getAsString("widget", data);

    return switch (type) {
      "input" => TextFieldBlocBuilder(textFieldBloc: fieldBloc as TextFieldBloc),
      "select" => RadioButtonGroupFieldBlocBuilder(
        selectFieldBloc: fieldBloc as SelectFieldBloc,
        itemBuilder: (context, item) => item,
      ),
      _ => throw Exception("Unknown field widget $type")
    };
  }


  static SingleFieldBloc _buildFieldBloc({ required Map<String, dynamic> data }) {

    String type = ValueUtil.getAsString("widget", data);

    return switch (type) {
      "input" => _buildInputField(data: data),
      "select" => _buildSelectField(data: data),
      _ => throw Exception("Unknown field bloc $type")
    } as SingleFieldBloc;
  }


  static TextFieldBloc _buildInputField({ required Map<String, dynamic> data }) {
    return TextFieldBloc(
      name: ValueUtil.getAsString("name", data),
      initialValue: ValueUtil.getAsString("initialValue", data),
      validators: []
    );
  }


  static SelectFieldBloc _buildSelectField({ required Map<String, dynamic> data }) {
    return SelectFieldBloc(
      name: ValueUtil.getAsString("name", data),
      initialValue: ValueUtil.getAsString("initialValue", data),
      validators: []
    );
  }

}
