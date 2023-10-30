
import 'package:flutter/cupertino.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/managers/FieldManager.dart';
import 'package:formcraft/src/managers/FormManager.dart';

class StateManager {


  static final FormManager _form = FormManager();
  static final FieldManager _field = FieldManager();
  static BuildContext? context;


  static void addForm({ required String key, required FormBloc form }) => _form.set<FormBloc>(key, form);

  static void addField({ required String key, required SingleFieldBloc field}) => _field.set<SingleFieldBloc>(key, field);

  static void addFieldForm({ required String key, required SingleFieldBloc field, int? step }) {
    _form.addFieldBloc(key: key, field: field, step: step);
  }


  static bool hasForm(String key) => _form.has(key);

  static bool hasField(String key) => _field.has(key);

  StateManager._();

}


