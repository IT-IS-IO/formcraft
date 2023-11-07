
import 'condition_operators_interface.dart';


class LessThan extends ConditionOperator {
  @override
  String get operatorKey {
    return 'lessThan';
  }

  @override
  String get displayedName {
    return 'Less Than';
  }

  @override
  bool execute(Map<String, dynamic> options) {

    var value = options['value'];
    var comparedValue = options['comparedValue'];

    return (value is num) && (value < comparedValue);
  }

}
