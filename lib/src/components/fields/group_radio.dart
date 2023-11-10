

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field.dart';

import '../field_interface.dart';

class GroupRadioComponent extends FieldComponent {

  GroupRadioComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    fieldBloc = SelectFieldBloc(items: FieldUtil.buildOptions(attributes));
  }

  @override
  String get type {
    return 'GroupRadioComponent';
  }

  @override
  Widget get componentWidget {
    return RadioButtonGroupFieldBlocBuilder(
      key: uuid,
      selectFieldBloc: fieldBloc as SelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
      canTapItemTile: true,
    );
  }



}