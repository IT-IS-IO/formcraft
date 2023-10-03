
library _fc_parser;

import 'package:flutter/cupertino.dart';
import 'package:formcraft/src/builders/_forms/field_builder.dart';
import 'package:formcraft/src/builders/_forms/form_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_text_style.dart';
import 'package:formcraft/src/builders/_widgets/grid_builder.dart';
import 'package:formcraft/src/builders/_widgets/scaffold_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';


abstract class BuilderAbstract { }



class FormCraftBuilder extends BuilderAbstract {


  static Widget? build({ required Map<String, dynamic> data }) {

    // StateManager.set("FormCraftBuilder", MapManager.get("type", data));

    switch (MapManager.get("type", data)) {
      case "form": return FormBuilder.build(data: data);
      case "text": return Text(MapManager.get("title", data), style: TextStyleBuilder.build(data));
      case "container": return GridBuilder.container(data: data);
      case "column": return GridBuilder.column(data: data);
      case "row": return GridBuilder.row(data: data);
      case "grid": return GridBuilder.grid(data: data);
      case "scaffold": return ScaffoldBuilder.build(data: data);
      case "center": return Center( child: build(data: data["child"]) );
      default: return FieldBuilder.build(data: data);
    }
  }





}
