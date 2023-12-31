

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../interfaces/field_interface.dart';

class CheckboxComponent extends FieldComponent {

  CheckboxComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    listener = BooleanFieldBloc();
  }

  @override
  String get type {
    return 'CheckboxComponent';
  }


  @override
  Widget get componentWidget {
    return CheckboxFieldBlocBuilder(
      key: key,
      booleanFieldBloc: listener as BooleanFieldBloc,
      body: Text(attributes['label'] ?? ''),
    );
  }



}