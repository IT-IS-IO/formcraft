
import 'package:collection/collection.dart';
import 'interface.dart';


class IsNotEqualTo extends ConditionOperator {

  @override
  String get operatorKey {
    return 'isNotEqual';
  }

  @override
  String get displayedName {
    return 'Is Not Equal To';
  }

  @override
  bool execute(Map<String, dynamic> options) {
    var value = options['value'];
    var comparedValue = options['comparedValue'];

    return !const DeepCollectionEquality().equals(value, comparedValue);
  }

}
