

import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/value_util.dart';
export 'package:flutter/material.dart';

abstract class Component<T> {

  Key uuid = const Key("Component");

  Map<String, dynamic> attributes = { };
  List<Component> children = [];

  Component? child;
  Widget? widget;


  String get type;


  List<Widget> get childrenWidgets {
    return children.map((child) => child.widget ?? const SizedBox()).toList();
  }


  Widget? render({ required Map<String, dynamic> data });


  void rebuildChild(Component child) {
    this.child = child;
  }


  Key buildUniqueKey(Map<String, dynamic> data) {
    return Key(ValueUtil.getAsString("uuid", data, defaultValue: UniqueKey().toString()));
  }


  void addChild(Component? child) {
    if (child == null) return;
    if (child.type == "RowComponent" || child.type == "ColumnComponent") children.add(child);
    else this.child = child;
  }


}