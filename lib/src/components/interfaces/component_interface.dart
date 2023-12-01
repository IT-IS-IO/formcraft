library component_interface;

import 'package:formcraft/src/components/interfaces/field_interface.dart';
import 'package:formcraft/src/other/typedefs/typedefs.dart';
import 'package:formcraft/src/providers/storage.dart';
import 'package:formcraft/src/utils/component.dart';
import 'package:jsonlogic/jsonlogic.dart';
export 'package:flutter/material.dart';

part 'package:formcraft/src/other/mixins/conditional_mixin.dart';


abstract class Component extends ChangeNotifier with Conditional {

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

    if (attributes.isNotEmpty) {
      _buildCondition(attributes);
    }

    _widget = _wrapWithListenable(componentWidget);

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