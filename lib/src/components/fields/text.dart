

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../field_interface.dart';

class TextFieldComponent extends FieldComponent {

  TextFieldComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    fieldBloc = TextFieldBloc();
  }

  @override
  String get type {
    return 'TextFieldComponent';
  }

  @override
  Widget get componentWidget {
    return TextFieldBlocBuilder(
      key: uuid,
      textFieldBloc: fieldBloc as TextFieldBloc,
    );
  }

}