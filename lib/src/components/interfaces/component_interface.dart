

import 'package:formcraft/src/utils/component.dart';
import 'conditional_interface.dart';
import 'package:flutter/material.dart';
export 'package:flutter/material.dart';


abstract class Component extends Conditional {

  Component({ Map<String, dynamic> attributes = const { } }):
        _attributes = attributes,
        key = attributes.containsKey("key")
        ? Key(attributes["key"])
        : UniqueKey();


  final Key key;


  final Map<String, dynamic> _attributes;


  String get type;


  bool _initialized = false;


  dynamic child;


  Widget? _widget;


  Widget get componentWidget;


  Widget? get widget => _widget;


  bool get initialized => _initialized;


  List<Widget> get children {
    if (child == null) return [];
    return (child as List<Component>).map((child) => child._widget ?? const SizedBox()).toList();
  }


  Map<String, dynamic> get attributes => _attributes;


  // set visible(bool value) {
  //   _visible = value;
  //   notifyListeners();
  // }


  Widget? render() {

    if (_initialized) return _widget;

    if (attributes.isNotEmpty && attributes.containsKey("logic")) {

      buildCondition({});

    }

    _widget = wrapWithListenable(componentWidget);

    _initialized = true;

    return _widget;

  }


  void addChild(Component? component) {
    if (component == null) return;
    if (ComponentUtil.hasChildren(type)) child == null ? child = [component] : child.add(component);
    else child = component;
  }


  void close() {
    dispose();
    listener.close();
  }


}