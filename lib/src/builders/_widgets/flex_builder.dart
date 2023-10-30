

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/managers/MapManager.dart';



class FlexBuilder {

  FlexBuilder._();


  static Widget build(Map<String, dynamic> data) {
    return switch (MapManager.getAsString("widget", data)) {
      "flex" => _flex(data),
      "flexible" => _flexible(data),
      "expanded" => _expanded(data),
      _ => const SizedBox.shrink(),
    };
  }


  static Flex _flex(Map<String, dynamic> data) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(MapManager.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(MapManager.getAsString("crossAxisAlignment", data)),
      children: MapManager.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Flexible _flexible(Map<String, dynamic> data) {
    return Flexible(
      flex: MapManager.getInt("flex", data),
      child: FormCraftBuilder.build(data: MapManager.get("child", data))!,
    );
  }


  static Expanded _expanded(Map<String, dynamic> data) {
    return Expanded(
      flex: MapManager.getInt("flex", data),
      child: FormCraftBuilder.build(data: MapManager.get("child", data))!,
    );
  }

}
