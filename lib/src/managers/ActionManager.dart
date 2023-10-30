
import 'package:formcraft/src/managers/abstract_manager.dart';


class ActionManager extends Manager {

  final List<Map<String, dynamic>> _data = [];

  void setAll(List<Map<String, dynamic>> _) => _data.addAll(_);


  Map<String, dynamic> getActions(Map<String, dynamic> data) {

    Map<String, dynamic> actions = { };

    if (data.containsKey("actions")) {

      actions = switch (data["actions"].runtimeType) {
        String => has(data['actions']) ? get(data['actions']) : { },
        Map => data['actions'],
        _ => {},
      };

    }

    return actions;

  }


  @override
  T? get<T>(String key) {
    return _data.firstWhere((element) => element["name"] == key, orElse: () => { }) as T?;
  }


  @override
  bool has(String key) {
    return _data.any((element) => element["name"] == key);
  }


  @override
  void set<T>(String key, T value) {
    if (has(key)) return;
    _data.add({ "name": key, "value": value });
  }


  @override
  void clear() {
    _data.clear();
  }


  @override
  void remove(String key) {
    _data.removeWhere((element) => element["name"] == key);
  }


  bool get hasActions => _data.isNotEmpty;


}





