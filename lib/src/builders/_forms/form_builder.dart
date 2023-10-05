
import 'package:flutter/material.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:formcraft/src/builders/_forms/field_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';
import 'package:formcraft/src/managers/StateManager.dart';


class FormBuilder {

  static const IDENTITY_KEY = "form";

  static Widget? build({ required Map<String, dynamic> data }) {

    StateManager.addForm(key: MapManager.getAsString("name", data), form: FormBlocBuilder());

    return FieldBuilder.build(data: MapManager.get("child", data));

  }


}




class FormBlocBuilder<T> extends FormBloc<T, T> {

  FormBlocBuilder() : super(isLoading: false);

  @override
  void onSubmitting() { }

}