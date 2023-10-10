
import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/_forms/form_builder.dart';
import 'package:formcraft/src/builders/_typographies/_text_builder.dart';
import 'package:formcraft/src/builders/_widgets/button_builder.dart';
import 'package:formcraft/src/builders/_widgets/grid_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';


class FormCraftBuilder {

  const FormCraftBuilder._();

  static Widget? build({ required Map<String, dynamic> data }) {

    return switch (MapManager.getAsString("type", data)) {
      'form' => FormBuilder.build(data),
      'grid' => GridBuilder.build(data),
      'text' => TextBuilder.build(data),
      'button' => ButtonBuilder.build(data),
      // 'scaffold' => ScaffoldBuilder.build(data: data),
      _ => const SizedBox.shrink(), //Default value
    };

  }

}
