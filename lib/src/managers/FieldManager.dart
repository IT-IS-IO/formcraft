
import 'package:formcraft/src/managers/abstract_manager.dart';



class FieldManager extends Manager {


  void updateValidators(String key, List<Object? Function(dynamic)> validators) {
    if (!has(key)) return;
    data[key]!.updateValidators(validators);
  }


  @override
  void set<T>(String key, T value) {
    if (has(key)) return;
    data[key] = value;
  }


  @override
  void clear() {
    data
      ..forEach((key, value) => value.close())
      ..clear();
  }


  @override
  void remove(String key) {
    data[key]?.close();
    data.remove(key);
  }


  bool get hasFields => data.isNotEmpty;


}