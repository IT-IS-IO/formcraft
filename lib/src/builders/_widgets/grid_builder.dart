

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/managers/MapManager.dart';



class GridBuilder {

  GridBuilder._();


  static Widget build(Map<String, dynamic> data) {
    return switch (MapManager.getAsString("widget", data)) {
      "container" => container(data),
      "column" => column(data),
      "center" => center(data),
      "row" => row(data),
      "grid" => grid(data),
      _ => const SizedBox.shrink(),
    };
  }


  static Widget row(Map<String, dynamic> data) {
    return Row(
      mainAxisSize: AlignBuilder.mainAxisSize(MapManager.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(MapManager.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(MapManager.getAsString("crossAxisAlignment", data)),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget grid(Map<String, dynamic> data) {
    return GridView.count(
      crossAxisCount: MapManager.getInt("crossAxisCount", data),
      crossAxisSpacing: MapManager.getDouble("crossAxisSpacing", data),
      mainAxisSpacing: MapManager.getDouble("mainAxisSpacing", data),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget column(Map<String, dynamic> data) {
    return Column(
      mainAxisSize: AlignBuilder.mainAxisSize(MapManager.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(MapManager.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(MapManager.getAsString("crossAxisAlignment", data)),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Center center(Map<String, dynamic> data) {
    return Center(
      child: FormCraftBuilder.build(data: MapManager.get("child", data)),
    );
  }


  static Container container(Map<String, dynamic> data) {
    return Container(
      // color: MapManager.getColor("color", data),
      // width: MapManager.getDouble("width", data),
      // height: MapManager.getDouble("height", data),
      child: FormCraftBuilder.build(data: MapManager.get("child", data)),
    );
  }


}
