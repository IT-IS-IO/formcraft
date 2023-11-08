

import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/components/components.dart';
import 'package:formcraft/src/utils/value_util.dart';

import '../interface.dart';



class GridBuilder extends FormCraftBuilder {


  @override
  String get type => "GridBuilder";


  @override
  Widget? build({ required Map<String, dynamic> data }) {

    String type = getWidgetType(data);

    return switch (type) {
      "container" => container(data),
      "column" => column(data),
      "center" => center(data),
      "row" => row(data),
      "grid" => grid(data),
      _ => throw Exception("Unknown Grid widget $type")
    };
  }


}
