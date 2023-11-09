
import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/value.dart';


class ConstraintsBuilder {

  const ConstraintsBuilder._();

  static BoxConstraints? build(Map<String, dynamic> data) {
    if (!data.containsKey("constraints")) return null;
    return BoxConstraints(
      minWidth: ValueUtil.getDouble("minWidth", data),
      maxWidth: ValueUtil.getDouble("maxWidth", data),
      minHeight: ValueUtil.getDouble("minHeight", data),
      maxHeight: ValueUtil.getDouble("maxHeight", data),
    );
  }

}