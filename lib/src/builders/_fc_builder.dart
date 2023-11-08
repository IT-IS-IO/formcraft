
import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/widgets/field_builder.dart';
import 'package:formcraft/src/builders/widgets/button_builder.dart';
import 'package:formcraft/src/builders/widgets/custom_widget_builder.dart';
import 'package:formcraft/src/builders/widgets/flex_builder.dart';
import 'package:formcraft/src/builders/widgets/grid_builder.dart';
import 'package:formcraft/src/builders/widgets/text_builder.dart';
import 'package:formcraft/src/utils/value_util.dart';
import 'interface.dart' as fc_interface;

// class FormCraftBuilder extends fc_interface.FormCraftBuilder {
//
//
//   @override
//   String get type => "FormCraftBuilder";
//
//
//   @override
//   Widget? build({ required Map<String, dynamic> data }) {
//
//     String type = getWidgetType(data);
//
//     return switch (type) {
//       'grid' => GridBuilder.build(data),
//       'text' => TextBuilder.build(data),
//       "flex" => FlexBuilder.build(data),
//       'form' => FieldBuilder.build(data),
//       'button' => ButtonBuilder.build(data),
//       "custom" => CustomWidgetBuilder.build(data),
//       _ => throw Exception("Unknown type $type")
//     };
//
//   }
//
//
// }



