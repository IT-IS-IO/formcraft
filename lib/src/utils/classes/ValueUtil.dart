

import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/classes/MapUtil.dart';

class ValueUtil {


  static bool has(String key, Map<String, dynamic> data) => MapUtil.has(key, data);


  static Map<String, dynamic> get(String key, Map<String, dynamic> data) {
    return MapUtil.has(key, data) ? data[key] : {};
  }


  static String getAsString(String key, Map<String, dynamic> data, { String defaultValue = "" }) {
    return MapUtil.has(key, data) ? data[key] : defaultValue;
  }


  static Color getColor(String key, Map<String, dynamic> data, { Color defaultValue = Colors.grey }) {
    return MapUtil.has(key, data) ? Color(int.parse(data[key])) : defaultValue;
  }


  static double getDouble(String key, Map<String, dynamic> data) {
    return MapUtil.has(key, data) ? double.parse(data[key]) : 0.0;
  }


  static bool getBool(String key, Map<String, dynamic> data, { bool defaultValue = false }) {
    return MapUtil.has(key, data) ? data[key] : defaultValue;
  }


  static int getInt(String key, Map<String, dynamic> data, { int defaultValue = 0 }) {
    return MapUtil.has(key, data) ? int.parse(data[key]) : defaultValue;
  }


  static int? tryGetInt(String key, Map<String, dynamic> data) {
    return MapUtil.has(key, data) ? int.tryParse(data[key]) : null;
  }


  static List<Map<String, dynamic>> getList(String key, Map<String, dynamic> data) {
    return MapUtil.has(key, data) ? List<Map<String, dynamic>>.from(data[key]) : [];
  }


}