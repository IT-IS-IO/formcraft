

import 'package:flutter/material.dart';
import 'package:formcraft/src/managers/MapManager.dart';


class PaddingBuilder {

  static EdgeInsetsGeometry getPadding(Map<String, dynamic> map) {
    if (map.containsKey("padding")) {
      return EdgeInsetsGeometry.lerp(
        EdgeInsets.zero,
        EdgeInsets.all( MapManager.getDouble("padding", map) ),
        1.0
      )!;
    }
    return EdgeInsets.zero;
  }

}