

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_widgets/pager_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';



class CustomWidgetBuilder {

  CustomWidgetBuilder._();

  static Widget build(Map<String, dynamic> data) {
    return switch (MapManager.getAsString("widget", data)) {
      "pager" => PagerBuilder.build(data),
      _ => const SizedBox.shrink(),
    };
  }


}
