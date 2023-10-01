
import 'package:flutter/cupertino.dart';
import 'package:form_bloc/form_bloc.dart';



class FormManager extends ChangeNotifier {


  final Map<String, SingleFieldBloc> _fields = { };


  bool get hasFields => _fields.isNotEmpty;


  bool hasField(String key) => _fields.containsKey(key);


  SingleFieldBloc? getField(String key) {
    if (!hasField(key)) return null;
    return _fields[key];
  }


  void addField(String key, SingleFieldBloc data) {
    _fields[key] = data;
  }


  void removeField(String key) {
    _fields[key]?.close();
    _fields.remove(key);
  }


  void updateValidators(String key, List<Object? Function(dynamic)> validators) {
    if (!hasField(key)) return;
    _fields[key]!.addValidators(validators);
  }


}