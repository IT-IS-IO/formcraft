
import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/value.dart';
export 'package:flutter/material.dart';

abstract class FormCraftBuilder {

  String get type;

  Widget? build({ required Map<String, dynamic> data });

  String getWidgetType(Map<String, dynamic> data, [String key = 'type']) {
    return ValueUtil.getAsString(key, data);
  }


}
