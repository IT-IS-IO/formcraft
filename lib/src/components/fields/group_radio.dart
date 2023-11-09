

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/utils/field.dart';

import '../field_interface.dart';

class GroupRadioComponent extends FieldComponent {

  GroupRadioComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'GroupRadioComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }

  @override
  Widget get componentWidget {

    fieldBloc = SelectFieldBloc(
      items: FieldUtil.buildOptions(attributes),
    );

    return RadioButtonGroupFieldBlocBuilder(
      key: uuid,
      selectFieldBloc: fieldBloc as SelectFieldBloc,
      itemBuilder: FieldUtil.itemBuilder,
      canTapItemTile: true,
    );
  }



}