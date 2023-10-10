

import 'package:flutter/material.dart';
import 'package:formcraft/src/managers/MapManager.dart';



class PagerBuilder {

  PagerBuilder._();

  static Widget build(Map<String, dynamic> data) {
    return switch (MapManager.getAsString("widget", data)) {
      _ => const SizedBox.shrink(),
    };
  }


}
