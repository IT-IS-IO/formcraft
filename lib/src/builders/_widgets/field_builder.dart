
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/builders/_events/action_builder.dart';
import 'package:formcraft/src/builders/_widgets/text_builder.dart';
import 'package:formcraft/src/managers/StateManager.dart';
import 'package:formcraft/src/utils/field_util.dart';
import 'package:formcraft/src/utils/map_util.dart';
import 'package:formcraft/src/utils/value_util.dart';


class FieldBuilder {


  static Widget build(Map<String, dynamic> data) {

    if (MapUtil.has("name", data) && StateManager.hasFieldBloc(ValueUtil.getAsString("name", data))) {
      return _buildFieldWidget(data: data, fieldBloc: StateManager.getFieldBloc(ValueUtil.getAsString("name", data)));
    }

    SingleFieldBloc fieldBloc = _buildFieldBloc(data: data);

    StateManager.addFieldBloc(
      key: ValueUtil.getAsString("name", data),
      formKey: ValueUtil.getAsString("form", data),
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
      "checkbox" => CheckboxFieldBlocBuilder(
        booleanFieldBloc: fieldBloc as BooleanFieldBloc,
        body: TextBuilder.build(ValueUtil.get("body", data)),
      ),
      "radioGroup" => RadioButtonGroupFieldBlocBuilder(
        selectFieldBloc: fieldBloc as SelectFieldBloc,
        itemBuilder: FieldUtil.itemBuilder,
        canTapItemTile: true,
      ),
      "checkboxGroup" => CheckboxGroupFieldBlocBuilder(
        multiSelectFieldBloc: fieldBloc as MultiSelectFieldBloc,
        itemBuilder: FieldUtil.itemBuilder,
        canTapItemTile: true,
      ),
      "select" => RadioButtonGroupFieldBlocBuilder(
        selectFieldBloc: fieldBloc as SelectFieldBloc,
        itemBuilder: FieldUtil.itemBuilder
      ),
      _ => throw Exception("Unknown field widget $type")
    };
  }


  static SingleFieldBloc _buildFieldBloc({ required Map<String, dynamic> data }) {

    String type = ValueUtil.getAsString("widget", data);

    return switch (type) {
      "input" => _buildInputField(data: data),
      "select" => _buildSelectField(data: data),
      "checkbox" => _buildCheckboxField(data: data),
      "checkboxGroup" => _buildMultiSelectField(data: data),
      "radioGroup" => _buildSelectField(data: data),
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
      items: FieldUtil.buildOptions(data),
    );
  }


  static BooleanFieldBloc _buildCheckboxField({ required Map<String, dynamic> data }) {
    return BooleanFieldBloc(
      name: ValueUtil.getAsString("name", data),
      initialValue: ValueUtil.getBool("initialValue", data),
    );
  }


  static MultiSelectFieldBloc _buildMultiSelectField({ required Map<String, dynamic> data }) {
    return MultiSelectFieldBloc(
      name: ValueUtil.getAsString("name", data),
      items: FieldUtil.buildOptions(data),
    );
  }

}


