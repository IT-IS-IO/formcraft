

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'field_interface.dart';

class TextFieldComponent extends FieldComponent {


  @override
  String get type {
    return 'TextFieldComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    fieldBloc = TextFieldBloc();
    
    widget = TextFieldBlocBuilder(
      key: uuid,
      textFieldBloc: fieldBloc as TextFieldBloc,
    );

    return widget;

  }


}