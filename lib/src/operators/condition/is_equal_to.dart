



import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:formcraft/src/utils/logger.dart';
import 'interface.dart';


class IsEqualTo extends ConditionOperator {


  @override
  String get operatorKey {
    return 'isEqual';
  }


  @override
  String get displayedName {
    return 'Is Equal To';
  }


  @override
  bool execute(Map<String, dynamic> options) {

    var value = options['value'];
    var comparedValue = options['comparedValue'];

    if (value != null && comparedValue != null && value.runtimeType != comparedValue.runtimeType && comparedValue is String) {

      try {
        comparedValue = jsonDecode(comparedValue);
      } catch (e) {
        Logger.error(e);
      }
    }

    // Special check for select boxes
    if (value is Map && comparedValue is String) {
      return value[comparedValue] == comparedValue;
    }

    return const DeepCollectionEquality().equals(value, comparedValue);
  }

}
