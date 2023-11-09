


class StorageProvider {

  static StorageProvider? _instance;

  Map<String, dynamic> _data = { };

  StorageProvider._();

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

}
