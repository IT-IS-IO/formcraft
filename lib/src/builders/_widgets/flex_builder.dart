

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';



class FlexBuilder {

  FlexBuilder._();


  static Widget build(Map<String, dynamic> data) {
    return switch (ValueUtil.getAsString("widget", data)) {
      "flex" => _flex(data),
      "flexible" => _flexible(data),
      "expanded" => _expanded(data),
      _ => const SizedBox.shrink(),
    };
  }


  static Flex _flex(Map<String, dynamic> data) {
    return Flex(
      direction: AlignBuilder.direction(ValueUtil.getAsString("direction", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: ValueUtil.getList("children", data).map<Widget>((_) => FormCraftBuilder.build(data: _) ?? const SizedBox()).toList(),
    );
  }


  static Flexible _flexible(Map<String, dynamic> data) {
    return Flexible(
      flex: ValueUtil.getInt("flex", data, defaultValue: 1),
      child: FormCraftBuilder.build(data: ValueUtil.get("child", data))!,
    );
  }


  static Expanded _expanded(Map<String, dynamic> data) {
    return Expanded(
      flex: ValueUtil.getInt("flex", data, defaultValue: 1),
      child: FormCraftBuilder.build(data: ValueUtil.get("child", data))!,
    );
  }

}
