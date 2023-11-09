

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../field_interface.dart';

class TextFieldComponent extends FieldComponent {

  TextFieldComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'TextFieldComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }

  @override
  Widget get componentWidget {

    fieldBloc = TextFieldBloc();

    return TextFieldBlocBuilder(
      key: uuid,
      textFieldBloc: fieldBloc as TextFieldBloc,
    );
  }




}