

abstract class ConditionOperator {


  String get operatorKey;


  String get displayedName;


  bool get requireValue {
    return true;
  }


  bool execute(Map<String, dynamic> options) {
    return true;
  }


  bool getResult({Map<String, dynamic> options = const {}}) {

    final value = options['value'];

    if (value is List) {
      return value.any((valueItem) => execute({...options, 'value': valueItem}));
    }

    return execute(options);

  }


}