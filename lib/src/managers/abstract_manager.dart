

abstract class Manager {

  final Map<String, dynamic> data = { };

  void set<T>(String key, T value) => data[key] = value;
  T? get<T>(String key) => data[key] as T?;
  bool has(String key) => data.containsKey(key);
  void remove(String key) => data.remove(key);
  void clear() => data.clear();

}