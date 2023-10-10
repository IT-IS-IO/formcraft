


import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_styles/_fc_text_style.dart';
import 'package:formcraft/src/managers/MapManager.dart';

class TextBuilder {

  const TextBuilder._();

  static Text build(Map<String, dynamic> data) {
    return Text(
      MapManager.getAsString("text", data),
      style: TextStyleBuilder.build(MapManager.get("style", data))
    );
  }


}