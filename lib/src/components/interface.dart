
import 'package:flutter/material.dart';
import '../utils/logger.dart';
export 'package:flutter/material.dart';

abstract class Component extends ChangeNotifier {

  Component({
    Map<String, dynamic> attributes = const { },
    Key? uuid
  }) : uuid = uuid ?? UniqueKey() , attributes = attributes;

  final Key uuid;

  Map<String, dynamic> attributes = { };


  dynamic child;


  Widget? widget;


  bool hidden = false;


  String get type;


  Widget get componentWidget;


  List<Widget> get children {
    if (child == null) return [];
    return (child as List<Component>).map((child) => child.widget ?? const SizedBox()).toList();
  }


  Widget? render({ Map<String, dynamic>? data }) {

    if (attributes.isEmpty && data != null) {
      attributes.addAll(data);
    }
    else if (attributes.isEmpty && data == null) {
      Logger.error("Component: Attributes is empty");
    }

    return null;
  }


  void addChild(Component? _child) {
    if (_child == null) return;
    if (type == "RowComponent" || type == "ColumnComponent") {
      child == null ? child = [_child] : child.add(_child);
    }
    else child = _child;
  }


}