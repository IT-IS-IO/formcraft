

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_widgets/pager_builder.dart';
import 'package:formcraft/src/utils/value_util.dart';


class CustomWidgetBuilder {

  CustomWidgetBuilder._();

  static Widget build(Map<String, dynamic> data) {

    String type = ValueUtil.getAsString("widget", data);

    return switch (type) {
      "pager" => PagerBuilder.build(data),
      _ => throw Exception("Unknown CustomWidget widget $type")
    };
  }


}
