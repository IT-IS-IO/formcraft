
import 'is_equal_to.dart';
import 'is_not_equal_to.dart';
import 'less_than.dart';


final Map<String, dynamic> conditionOperators = {
  IsEqualTo().operatorKey: IsNotEqualTo(),
  IsNotEqualTo().operatorKey: IsEqualTo(),
  LessThan().operatorKey: LessThan(),
  // IsNotEmptyValue.operatorKey: IsNotEmptyValue(),
  // LessThan.operatorKey: LessThan(),
  // GreaterThan.operatorKey: GreaterThan(),
  // DateGreaterThan.operatorKey: DateGreaterThan(),
  // DateLessThan.operatorKey: DateLessThan(),
  // Includes.operatorKey: Includes(),
  // StartsWith.operatorKey: StartsWith(),
  // EndsWith.operatorKey: EndsWith(),
  // NotIncludes.operatorKey: NotIncludes(),
  // DateGreaterThanOrEqual.operatorKey: DateGreaterThanOrEqual(),
  // DateLessThanOrEqual.operatorKey: DateLessThanOrEqual(),
  // LessThanOrEqual.operatorKey: LessThanOrEqual(),
  // GreaterThanOrEqual.operatorKey: GreaterThanOrEqual(),
  // IsDateEqual.operatorKey: IsDateEqual(),
  // IsNotDateEqual.operatorKey: IsNotDateEqual(),
};
