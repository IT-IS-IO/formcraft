

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field.dart';
import '../field_interface.dart';

class GroupCheckboxComponent extends FieldComponent {

  GroupCheckboxComponent([
    Map<String, dynamic> attributes = const { }
  ]) : super(attributes: attributes) {
    listener = MultiSelectFieldBloc(items: FieldUtil.buildOptions(attributes));
  }

  @override
  String get type {
    return 'GroupCheckboxComponent';
  }


  @override
  Widget get componentWidget {
    return CheckboxGroupFieldBlocBuilder(
      key: uuid,
      multiSelectFieldBloc: listener as MultiSelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
      canTapItemTile: true,
    );

  }



}