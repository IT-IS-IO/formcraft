

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field.dart';

import '../interfaces/field_interface.dart';

class GroupRadioComponent extends FieldComponent {

  GroupRadioComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    listener = SelectFieldBloc(items: FieldUtil.buildOptions(attributes));
  }

  @override
  String get type {
    return 'GroupRadioComponent';
  }

  @override
  Widget get componentWidget {
    return RadioButtonGroupFieldBlocBuilder(
      key: key,
      selectFieldBloc: listener as SelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
      canTapItemTile: true,
    );
  }



}