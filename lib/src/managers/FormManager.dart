
import 'package:flutter/cupertino.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/utils/methods/methods.dart';



class FormManager extends ChangeNotifier {


  final Map<String, FormBloc> _forms = { };


  bool get hasForms => _forms.isNotEmpty;


  bool hasForm(String key) => _forms.containsKey(key);


  FormBloc getForm(String key) => _forms[key]!;


  void addForm(String key, FormBloc data) {
    _forms[key] = data;
  }


  void removeForm(String key) {
    _forms[key]?.close();
    _forms.remove(key);
  }


  bool addFieldBloc({ required String form, required SingleFieldBloc field, int? step }) {

    if (!hasForm(form)) return false;

    if (!isNull(step)) _forms[form]!.addFieldBloc(step: step!, fieldBloc: field);
    else _forms[form]!.addFieldBloc(fieldBloc: field);
    return true;
  }


  bool removeFieldBloc({ required String form, required SingleFieldBloc field, int? step }) {

    if (!hasForm(form)) return false;

    if (!isNull(step)) _forms[form]!.removeFieldBloc(step: step!, fieldBloc: field);
    else _forms[form]!.removeFieldBloc(fieldBloc: field);

    return true;
  }


  void clear() {
    _forms.forEach((key, value) => value.close());
    _forms.clear();
  }


}