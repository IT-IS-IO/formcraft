

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';



class GridBuilder {

  GridBuilder._();


  static Widget build(Map<String, dynamic> data) {
    return switch (ValueUtil.getAsString("widget", data)) {
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
      mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: ValueUtil.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget grid(Map<String, dynamic> data) {
    return GridView.count(
      crossAxisCount: ValueUtil.getInt("crossAxisCount", data),
      crossAxisSpacing: ValueUtil.getDouble("crossAxisSpacing", data),
      mainAxisSpacing: ValueUtil.getDouble("mainAxisSpacing", data),
      children: ValueUtil.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Widget column(Map<String, dynamic> data) {
    return Column(
      mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: ValueUtil.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Center center(Map<String, dynamic> data) {
    return Center(
      child: FormCraftBuilder.build(data: ValueUtil.get("child", data)),
    );
  }


  static Container container(Map<String, dynamic> data) {
    return Container(
      color: ValueUtil.getColor("color", data),
      // width: ValueUtil.getDouble("width", data),
      height: 1000,
      width: double.infinity,
      child: FormCraftBuilder.build(data: ValueUtil.get("child", data)),
    );
  }


}
