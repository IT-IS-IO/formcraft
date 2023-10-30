


import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_styles/_fc_text_style.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';

class TextBuilder {

  const TextBuilder._();

  static Widget build(Map<String, dynamic> data) {
    return switch (ValueUtil.getAsString("widget", data)) {
      "text" => text(data),
      "richText" => richText(data),
      _ => throw Exception("Unknown Text widget ${ValueUtil.getAsString("widget", data)}")
    };
  }


  static Text text(Map<String, dynamic> data) {
    return Text(
      ValueUtil.getAsString("data", data),
      style: TextStyleBuilder.build(ValueUtil.get("style", data))
    );
  }


  static TextSpan span(Map<String, dynamic> data) {
    return TextSpan(
      text: ValueUtil.getAsString("data", data),
      style: TextStyleBuilder.build(ValueUtil.get("style", data))
    );
  }


  static RichText richText(Map<String, dynamic> data) {
    return RichText(
      text: TextSpan(
        children: ValueUtil.getList("children", data).map<TextSpan>((_) => span(_) ).toList()
      )
    );
  }


}