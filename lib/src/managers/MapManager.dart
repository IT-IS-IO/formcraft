

import 'package:flutter/material.dart';

class MapManager {


  static bool has(String key, Map<String, dynamic> data) => data.containsKey(key);


  static String getAsString(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return data[key];
    }
    return "";
  }


  static Map<String, dynamic> get(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return data[key];
    }
    return {};
  }


  static Color getColor(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return Color(int.parse(data[key]));
    }
    return Colors.grey;
  }



  static double getDouble(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return double.parse(data[key]);
    }
    return 0.0;
  }


  static int getInt(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return int.parse(data[key]);
    }
    return 0;
  }



  static int? tryGetInt(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) {
      return int.tryParse(data[key]);
    }
    return null;
  }



  static List<Map<String, dynamic>> getList(String key, Map<String, dynamic> data) {
    if (data.containsKey(key)) return List<Map<String, dynamic>>.from(data[key]);
    return [];
  }




}