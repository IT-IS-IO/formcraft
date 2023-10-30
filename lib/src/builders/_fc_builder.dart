
import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/_forms/field_builder.dart';
import 'package:formcraft/src/builders/_typographies/_text_builder.dart';
import 'package:formcraft/src/builders/_widgets/button_builder.dart';
import 'package:formcraft/src/builders/_widgets/custom_widget_builder.dart';
import 'package:formcraft/src/builders/_widgets/flex_builder.dart';
import 'package:formcraft/src/builders/_widgets/grid_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';


class FormCraftBuilder {

  const FormCraftBuilder._();

  static Widget? build({ required Map<String, dynamic> data }) {

    String type = MapManager.getAsString("type", data);

    return switch (type) {
      'form' => FieldBuilder.build(data),
      'grid' => GridBuilder.build(data),
      'text' => TextBuilder.build(data),
      'button' => ButtonBuilder.build(data),
      "flex" => FlexBuilder.build(data),
      "custom" => CustomWidgetBuilder.build(data),
      // 'scaffold' => ScaffoldBuilder.build(data: data),
      _ => throw Exception("Unknown type $type")
    };

  }

}
