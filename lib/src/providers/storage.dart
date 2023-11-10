


import '../components/interface.dart';

class StorageProvider {

  StorageProvider._();

  static StorageProvider? _instance;

  final Map<String, dynamic> _data = { };

  static StorageProvider get instance {
    _instance ??= StorageProvider._();
    return _instance!;
  }


  dynamic get(String key) {
    return _data[key];
  }

  void set(String key, dynamic value) {
    _data[key] = value;
  }


  Component? getComponent(String key) {

    final _key = Key(key).toString();

    Map<String, dynamic> data = _data[_key];

    if (data.isEmpty) return null;

    return data['component'];
  }

}
