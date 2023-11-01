
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart' show FieldItem;
import 'package:formcraft/src/models/select_field_option.dart';
import 'package:formcraft/src/utils/classes/MapUtil.dart';

class FieldUtil {


  static List<SelectOption> buildOptions(Map<String, dynamic> data) {
    if (MapUtil.isEmpty("items", data)) return [];
    return List<Map<String, dynamic>>.from(data['items']).map((e) => SelectOption.fromJson(e)).toList();
  }


  static FieldItem itemBuilder(BuildContext context,  option) {
    return FieldItem(
      child: Text(
        option.label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }


}