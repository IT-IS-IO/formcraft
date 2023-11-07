
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/managers/abstract_manager.dart';


class FormManager extends Manager {


  bool addFieldBloc<T>({ required String key, required SingleFieldBloc field, int? step }) {

    if (step != null) data[key]!.addFieldBloc(step: step, fieldBloc: field);
    else data[key]!.addFieldBloc(fieldBloc: field);

    return true;
  }


  @override
  void set<T>(String key, T value) {
    if (has(key)) return;
    data[key] = value;
  }


  @override
  void clear() {
    data
      ..forEach((_, __) => __.close())
      ..clear();
  }


  @override
  void remove(String key) {
    data[key]?.close();
    data.remove(key);
  }


  bool get hasForms => data.isNotEmpty;


}


class FormBlocBuilder<T> extends FormBloc<T, T> {

  FormBlocBuilder() : super(isLoading: false);

  @override
  void onSubmitting() { }

}



