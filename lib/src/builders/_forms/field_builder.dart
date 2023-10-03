
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/managers/MapManager.dart';
import 'package:formcraft/src/managers/StateManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';



class FieldBuilder {

  static const IDENTITY_KEY = "type";


  static Widget? build({ required Map<String, dynamic> data }) {

    if (!StateManager.hasForm(MapManager.get("form", data))) {
      print("Форма у поли отсутствует");
      return null;
    }

    SingleFieldBloc? field = _getField(data: data)!;

    if (!isNull(field)) {
      StateManager.addField(key: MapManager.get("name", data), field: field);
      StateManager.addFieldToForm(key: MapManager.get("form", data), field: field);
      return _getFieldWidget(data: data, fieldBloc: field);
    }

    return null;
  }


  static Widget _getFieldWidget({ required Map<String, dynamic> data, required SingleFieldBloc fieldBloc}) {
    switch (MapManager.get(IDENTITY_KEY, data)) {
      case "input": return TextFieldBlocBuilder(textFieldBloc: fieldBloc as TextFieldBloc);
      default: return TextFieldBlocBuilder(textFieldBloc: fieldBloc as TextFieldBloc);
    }
  }


  static SingleFieldBloc? _getField({ required Map<String, dynamic> data }) {
    switch (MapManager.get(IDENTITY_KEY, data)) {
      case "input": return _buildInputField(data: data);
      case "select": return _buildSelectField(data: data);
      default: return null;
    }
  }




  static TextFieldBloc _buildInputField({ required Map<String, dynamic> data }) {
    return TextFieldBloc(
      name: MapManager.get("name", data),
      initialValue: MapManager.get("initialValue", data),
      validators: []
    );
  }


  static SelectFieldBloc _buildSelectField({ required Map<String, dynamic> data }) {
    return SelectFieldBloc(
      name: MapManager.get("name", data),
      initialValue: MapManager.get("initialValue", data),
      validators: []
    );
  }



}