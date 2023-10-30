
import 'package:flutter/cupertino.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/managers/ActionManager.dart';
import 'package:formcraft/src/managers/FieldManager.dart';
import 'package:formcraft/src/managers/FormManager.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';

class StateManager {

  StateManager._();

  static BuildContext? context;
  static String? uid;
  static Map<String, dynamic> data = {};

  static final FormManager _form = FormManager();
  static final FieldManager _field = FieldManager();
  static final ActionManager action = ActionManager();


  static void addFormBloc({ required String key }) => _form.set<FormBloc>(key, FormBlocBuilder());

  static void addFieldBloc({ required String key, required SingleFieldBloc field, int? step }) {

    addFormBloc(key: key);

    _form.addFieldBloc<SingleFieldBloc>(key: key, field: field, step: step);

  }

  static bool hasForm(String key) => _form.has(key);

  static bool hasField(String key) => _field.has(key);

  static bool hasAction(String key) => action.has(key);
  
  static FormBloc getForm(String key) => _form.get(key);

  static SingleFieldBloc getField(String key) => _field.get(key);

  static Map<String, dynamic> getAction(String key) => action.get(key);

  static Map<String, dynamic> getActions(Map<String, dynamic> data) => action.getActions(data);


  static void init(BuildContext context, Map<String, dynamic> data) {
    StateManager.data = data;
    StateManager.context = context;
    StateManager.uid = ValueUtil.getAsString("name", data, defaultValue: "FormCraft");
    StateManager.action.setAll(ValueUtil.getList("actions", data));
  }

  static void hasInstance() {
    if (context != null) {
      throw Exception("[$uid] StateManager has already other instance");
    }
  }

  static void dispose() {
    _form.clear();
    _field.clear();
    context = null;
    uid = null;
  }

}


