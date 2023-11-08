

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field_util.dart';
import 'field_interface.dart';

class GroupCheckboxComponent extends FieldComponent {


  @override
  String get type {
    return 'GroupCheckboxComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    fieldBloc = MultiSelectFieldBloc();

    widget = CheckboxGroupFieldBlocBuilder(
      key: uuid,
      multiSelectFieldBloc: fieldBloc as MultiSelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
    );

    return widget;

  }


}