

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field.dart';
import '../field_interface.dart';

class GroupCheckboxComponent extends FieldComponent {

  GroupCheckboxComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'GroupCheckboxComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }


  @override
  Widget get componentWidget {

    fieldBloc = MultiSelectFieldBloc(
      items: FieldUtil.buildOptions(attributes),
    );

    return CheckboxGroupFieldBlocBuilder(
      key: uuid,
      multiSelectFieldBloc: fieldBloc as MultiSelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
      canTapItemTile: true,
    );

  }



}