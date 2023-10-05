
import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/_forms/field_builder.dart';
import 'package:formcraft/src/builders/_forms/form_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_text_style.dart';
import 'package:formcraft/src/builders/_widgets/button_builder.dart';
import 'package:formcraft/src/builders/_widgets/grid_builder.dart';
import 'package:formcraft/src/builders/_widgets/scaffold_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';


abstract class BuilderAbstract { }



class FormCraftBuilder extends BuilderAbstract {


  static Widget? build({ required Map<String, dynamic> data }) {

    switch (MapManager.getAsString("type", data)) {
      case "form": return FormBuilder.build(data: data);
      case "grid": return GridBuilder.build(data: data);
      case "button": return ButtonBuilder.build(data: data);
      case "text": return Text(MapManager.getAsString("title", data), style: TextStyleBuilder.build(data));
      case "scaffold": return ScaffoldBuilder.build(data: data);
      default: return FieldBuilder.build(data: data);
    }

  }


}
