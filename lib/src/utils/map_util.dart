

class MapUtil {

  static bool has(String key, Map<String, dynamic> data) => data.containsKey(key);

  static bool isNotEmpty(String key, Map<String, dynamic> data) => !isEmpty(key, data);

  static bool isEmpty(String key, Map<String, dynamic> data) {
    return !has(key, data) || has(key, data) && List.from(data[key]).isEmpty;
  }

}