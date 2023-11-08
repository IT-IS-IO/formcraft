

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'field_interface.dart';

class CheckboxComponent extends FieldComponent {

  CheckboxComponent() : super();

  @override
  String get type {
    return 'CheckboxComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    super.render(data: data);

    fieldBloc = BooleanFieldBloc();

    widget = CheckboxFieldBlocBuilder(
      key: uuid,
      booleanFieldBloc: fieldBloc as BooleanFieldBloc,
      body: child?.widget ?? const SizedBox(),
    );

    return widget;

  }


}