

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/managers/MapManager.dart';


class GridBuilder extends BuilderAbstract {


  static Future<Widget> build({ required Map<String, dynamic> data }) async {
    return const SizedBox();
  }


  static Widget row({ required Map<String, dynamic> data }) {
    return Row(
      mainAxisSize: AlignmentBuilder.getMainAxisSize(MapManager.get("mainAxisSize", data)),
      mainAxisAlignment: AlignmentBuilder.getMainAxisAlignment(MapManager.get("mainAxisAlignment", data)),
      crossAxisAlignment: AlignmentBuilder.getCrossAxisAlignment(MapManager.get("crossAxisAlignment", data)),
      children: MapManager.getChildren(data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget grid({ required Map<String, dynamic> data }) {
    return GridView.count(
      crossAxisCount: MapManager.getInt("crossAxisCount", data),
      crossAxisSpacing: MapManager.getDouble("crossAxisSpacing", data),
      mainAxisSpacing: MapManager.getDouble("mainAxisSpacing", data),
      children: MapManager.getChildren(data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget column({ required Map<String, dynamic> data }) {
    return Column(
      mainAxisSize: AlignmentBuilder.getMainAxisSize(MapManager.get("mainAxisSize", data)),
      mainAxisAlignment: AlignmentBuilder.getMainAxisAlignment(MapManager.get("mainAxisAlignment", data)),
      crossAxisAlignment: AlignmentBuilder.getCrossAxisAlignment(MapManager.get("crossAxisAlignment", data)),
      children: MapManager.getChildren(data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Container container({ required Map<String, dynamic> data }) {
    return Container(
      // color: MapManager.getColor("color", data),
      // width: MapManager.getDouble("width", data),
      // height: MapManager.getDouble("height", data),
      child: FormCraftBuilder.build(data: data["child"]),
    );
  }


}
