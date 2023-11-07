
import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/_widgets/field_builder.dart';
import 'package:formcraft/src/builders/_widgets/button_builder.dart';
import 'package:formcraft/src/builders/_widgets/custom_widget_builder.dart';
import 'package:formcraft/src/builders/_widgets/flex_builder.dart';
import 'package:formcraft/src/builders/_widgets/grid_builder.dart';
import 'package:formcraft/src/builders/_widgets/text_builder.dart';
import 'package:formcraft/src/utils/value_util.dart';


class FormCraftBuilder {

  const FormCraftBuilder._();

  static Widget? build({ required Map<String, dynamic> data }) {

    String type = ValueUtil.getAsString("type", data);

    return switch (type) {
      'grid' => GridBuilder.build(data),
      'text' => TextBuilder.build(data),
      "flex" => FlexBuilder.build(data),
      'form' => FieldBuilder.build(data),
      'button' => ButtonBuilder.build(data),
      "custom" => CustomWidgetBuilder.build(data),
      _ => throw Exception("Unknown type $type")
    };

  }

}
