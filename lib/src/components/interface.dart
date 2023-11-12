
import 'package:flutter/material.dart';
import 'package:formcraft/src/components/field_interface.dart';
import 'package:formcraft/src/other/typedefs/typedefs.dart';
import 'package:formcraft/src/utils/component.dart';
import 'package:formcraft/src/operators/condition.dart';
import '../utils/logger.dart';
export 'package:flutter/material.dart';

abstract class Component extends ChangeNotifier {

  Component({
    this.attributes = const { }
  }) : uuid = attributes.containsKey("key")
        ? Key(attributes["key"])
        : UniqueKey();


  final Key uuid;


  Map<String, dynamic> attributes = { };


  Condition? condition;


  ListenOperator? listener;


  dynamic child;


  Widget? widget;


  bool _visible = true;


  bool listenable = false;


  String get type;


  Widget get componentWidget;


  bool get isVisible => _visible;


  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }


  List<Widget> get children {
    if (child == null) return [];
    return (child as List<Component>).map((child) => child.widget ?? const SizedBox()).toList();
  }


  bool get hasCondition => condition != null;


  Widget? render({ Map<String, dynamic>? data }) {

    if (attributes.isEmpty && data != null) {
      attributes.addAll(data);
    }
    else if (attributes.isEmpty && data == null) {
      Logger.error("Component: Attributes is empty");
    }


    if (attributes.containsKey("logic")) {

      listener ??= ListenOperatorBuilder();

      condition = Condition(this, attributes['logic']);

      visible = condition!.evaluate();

    }


    widget = _wrapWithListenable();


    return widget;

  }


  Widget _wrapWithListenable() {

    if (!hasCondition) return componentWidget;

    listenable = true;

    return ListenableBuilder(
      listenable: this,
      builder: (context, child) {
        if (!isVisible) return const SizedBox();
        return componentWidget;
      },
    );

  }


  void addChild(Component? _child) {
    if (_child == null) return;
    if (ComponentUtil.hasChildren(type)) child == null ? child = [_child] : child.add(_child);
    else child = _child;
  }


  void close() {
    dispose();
    listener?.close();
    // throw Exception("Component: Close method not implemented");
  }


}