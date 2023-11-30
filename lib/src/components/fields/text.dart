

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../interfaces/field_interface.dart';

class TextFieldComponent extends FieldComponent {

  TextFieldComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    listener = TextFieldBloc();
  }

  @override
  String get type {
    return 'TextFieldComponent';
  }

  @override
  Widget get componentWidget {
    return TextFieldBlocBuilder(
      key: key,
      textFieldBloc: listener as TextFieldBloc,
    );
  }

}