
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart' show FieldItem;
import 'package:formcraft/src/models/select_field_option.dart';
import 'package:formcraft/src/utils/map.dart';


class FieldUtil {


   static List<SelectOption> buildOptions(Map<String, dynamic> data) {
    if (MapUtil.isEmpty("values", data)) return [];
    return List<Map<String, dynamic>>.from(data['values']).map((e) => SelectOption.fromJson(e)).toList();
  }


   static FieldItem itemBuilder(BuildContext context, option) {
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
