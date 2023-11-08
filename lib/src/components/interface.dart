

import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/value_util.dart';
export 'package:flutter/material.dart';

abstract class Component {

  Component({ Key? uuid }) : uuid = uuid ?? UniqueKey();

  Key uuid = UniqueKey();

  Map<String, dynamic> attributes = { };
  dynamic child;

  Widget? widget;


  String get type;


  List<Widget> get childrenWidgets {
    if (child == null) return [];
    return (child as List<Component>).map((child) => child.widget ?? const SizedBox()).toList();
  }


  Widget? render({ required Map<String, dynamic> data }) {
    attributes.addAll(data);
    return null;
  }


  void rebuild() {

    // widget = render(data: attributes);

  }


  Key buildUniqueKey(Map<String, dynamic> data) {
    return Key(ValueUtil.getAsString("uuid", data, defaultValue: UniqueKey().toString()));
  }


  void addChild(Component? _child) {
    print("Component $_child");

    if (_child == null) return;
    if (type == "RowComponent" || type == "ColumnComponent") {
      child == null ? child = [_child] : child.add(_child);
    }
    else child = _child;

    print("child $child");
  }


}