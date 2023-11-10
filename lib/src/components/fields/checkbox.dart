

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../field_interface.dart';

class CheckboxComponent extends FieldComponent {

  CheckboxComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    fieldBloc = BooleanFieldBloc();
  }

  @override
  String get type {
    return 'CheckboxComponent';
  }


  @override
  Widget get componentWidget {
    return CheckboxFieldBlocBuilder(
      key: uuid,
      booleanFieldBloc: fieldBloc as BooleanFieldBloc,
      body: Text(attributes['label'] ?? ''),
    );
  }



}