
import 'package:flutter/material.dart';
import 'package:formcraft/src/components/interfaces/field_interface.dart';
import 'package:formcraft/src/other/typedefs/typedefs.dart';
import 'package:formcraft/src/operators/condition.dart';


abstract class Conditional extends ChangeNotifier {

  ListenOperator listener = ListenOperatorBuilder();

  Condition? _condition;

  bool _listenable = false;

  bool _visible = true;

  bool get listenable => _listenable;

  bool get conditional => _condition != null;

  bool get isVisible => _visible;


  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }


  bool buildCondition(Map<String, dynamic> logic) {

    // _condition = Condition(this, logic);

    // visible = _condition!.evaluate();

    return true;
  }


  Widget wrapWithListenable(Widget widget) {

    if (!conditional) return widget;

    _listenable = true;

    return ListenableBuilder(
      listenable: this,
      builder: (context, child) {
        if (!isVisible) return const SizedBox();
        return widget;
      },
    );

  }

}

