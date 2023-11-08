

import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/value_util.dart';
export 'package:flutter/material.dart';

abstract class Component<T> {

  Key uuid = const Key("Component");

  Map<String, dynamic> attributes = { };
  List<Widget> children = [];

  Widget? child;
  Widget? widget;


  String get type;


  Widget? render({ required Map<String, dynamic> data });


  void rebuildChild(Widget child) {
    this.child = child;
  }



  Key buildUniqueKey(Map<String, dynamic> data) {
    return Key(ValueUtil.getAsString("uuid", data, defaultValue: type));
  }


}