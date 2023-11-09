

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../field_interface.dart';

class CheckboxComponent extends FieldComponent {

  CheckboxComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'CheckboxComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }

  @override
  Widget get componentWidget {
    fieldBloc = BooleanFieldBloc();
    return CheckboxFieldBlocBuilder(
      key: uuid,
      booleanFieldBloc: fieldBloc as BooleanFieldBloc,
      body: Text(attributes['label'] ?? ''),
    );
  }



}