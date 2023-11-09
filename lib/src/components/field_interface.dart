

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/components/interface.dart';
export 'package:flutter/material.dart';

abstract class FieldComponent extends Component {

  FieldComponent({
    Map<String, dynamic> attributes = const { },
    Key? uuid
  }) : super(
      attributes: attributes,
      uuid: uuid
  );


  SingleFieldBloc? fieldBloc;

  bool get isFieldComponent => true;

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