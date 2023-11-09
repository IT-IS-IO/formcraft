
import 'package:formcraft/src/components/grid/column.dart';
import 'package:formcraft/src/components/grid/row.dart';
import 'package:formcraft/src/components/interface.dart';


class ComponentUtil {


  static Component? findByUuid(String uuid, { Component? component }) {
    throw UnimplementedError();
  }


  static bool isLayoutComponent(String type) {
    return {
      RowComponent().type,
      ColumnComponent().type,
    }.contains(type);
  }


  static bool hasChildren(String type) {
    return {
      RowComponent().type,
      ColumnComponent().type,
    }.contains(type);
  }


}
