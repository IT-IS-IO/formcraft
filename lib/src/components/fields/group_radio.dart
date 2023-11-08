

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field_util.dart';

import 'field_interface.dart';

class GroupRadioComponent extends FieldComponent {


  @override
  String get type {
    return 'GroupRadioComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    fieldBloc = SelectFieldBloc();

    widget = RadioButtonGroupFieldBlocBuilder(
      key: uuid,
      selectFieldBloc: fieldBloc as SelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
    );

    return widget;

  }


}