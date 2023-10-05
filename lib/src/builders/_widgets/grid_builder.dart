

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/managers/MapManager.dart';


class GridBuilder extends BuilderAbstract {


  static Widget build({ required Map<String, dynamic> data }) {

    switch(MapManager.getAsString("widget", data)) {
      case "container": return container(data: data);
      case "column": return column(data: data);
      case "row": return row(data: data);
      case "grid": return grid(data: data);
      case "center": return Center( child: FormCraftBuilder.build(data: MapManager.get("child", data)) );
      default: return const SizedBox();
    }

  }


  static Widget row({ required Map<String, dynamic> data }) {
    return Row(
      mainAxisSize: AlignmentBuilder.getMainAxisSize(MapManager.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignmentBuilder.getMainAxisAlignment(MapManager.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignmentBuilder.getCrossAxisAlignment(MapManager.getAsString("crossAxisAlignment", data)),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget grid({ required Map<String, dynamic> data }) {
    return GridView.count(
      crossAxisCount: MapManager.getInt("crossAxisCount", data),
      crossAxisSpacing: MapManager.getDouble("crossAxisSpacing", data),
      mainAxisSpacing: MapManager.getDouble("mainAxisSpacing", data),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget column({ required Map<String, dynamic> data }) {
    return Column(
      mainAxisSize: AlignmentBuilder.getMainAxisSize(MapManager.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignmentBuilder.getMainAxisAlignment(MapManager.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignmentBuilder.getCrossAxisAlignment(MapManager.getAsString("crossAxisAlignment", data)),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Container container({ required Map<String, dynamic> data }) {
    return Container(
      // color: MapManager.getColor("color", data),
      // width: MapManager.getDouble("width", data),
      // height: MapManager.getDouble("height", data),
      child: FormCraftBuilder.build(data: MapManager.get("child", data)),
    );
  }


}
