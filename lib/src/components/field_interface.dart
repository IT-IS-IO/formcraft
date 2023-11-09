

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/components/interface.dart';
export 'package:flutter/material.dart';

abstract class FieldComponent extends Component {

  FieldComponent({ Map<String, dynamic> attributes = const { } }) : super(attributes: attributes);


  SingleFieldBloc? fieldBloc;


  bool get conditional => attributes.containsKey('logic');


  void updateValue(dynamic value) {
    fieldBloc?.updateValue(value);
  }

  void changeValue(dynamic value) {
    fieldBloc?.changeValue(value);
  }

  dynamic get value => fieldBloc?.value;

  void validate() {
    fieldBloc?.validate();
  }







}