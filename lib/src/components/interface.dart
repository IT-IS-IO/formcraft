
import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/component.dart';
import '../utils/logger.dart';
export 'package:flutter/material.dart';

abstract class Component extends ChangeNotifier {

  Component({
    Map<String, dynamic> attributes = const { }
  }) : attributes = attributes,
       uuid = attributes.containsKey("key")
          ? Key(attributes["key"])
          : UniqueKey();


  final Key uuid;


  Map<String, dynamic> attributes = { };


  dynamic child;


  Widget? widget;


  Widget? oldWidget;


  bool visible = true;


  bool listenable = false;


  String get type;


  Widget get componentWidget;


  List<Widget> get children {
    if (child == null) return [];
    return (child as List<Component>).map((child) => child.widget ?? const SizedBox()).toList();
  }


  bool get hasCondition => attributes.containsKey("logic");


  Widget? render({ Map<String, dynamic>? data }) {

    if (attributes.isEmpty && data != null) {
      attributes.addAll(data);
    }
    else if (attributes.isEmpty && data == null) {
      Logger.error("Component: Attributes is empty");
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
        if (!visible) return const SizedBox();
        return componentWidget;
      },
    );

  }


  void addChild(Component? _child) {
    if (_child == null) return;
    if (ComponentUtil.hasChildren(type)) child == null ? child = [_child] : child.add(_child);
    else child = _child;
  }


  void toggleHide() {
    if (!listenable) {
      throw Exception("Component: Not listenable");
    }
    visible = !visible;
    notifyListeners();
  }


  void close() {
    throw Exception("Component: Close method not implemented");
  }

}