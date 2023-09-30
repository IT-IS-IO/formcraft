




import 'package:flutter/material.dart';

class MapManager {

  static String get(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      return map[key];
    }
    return "";
  }



  static Color getColor(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      return Color(int.parse(map[key]));
    }
    return Colors.black;
  }



  static double getDouble(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      return double.parse(map[key]);
    }
    return 0.0;
  }


  static int getInt(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      return int.parse(map[key]);
    }
    return 0;
  }


  static List<Map<String, dynamic>> getChildren(Map<String, dynamic> map) {
    if (map.containsKey("children")) {
      return List<Map<String, dynamic>>.from(map["children"]);
    }
    return [];
  }

}