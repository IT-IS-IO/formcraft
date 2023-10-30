

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/widgets/other/pager/core/controllers/pager_controller.dart';
import 'package:formcraft/src/widgets/other/pager/drawer/pager_drawer.dart';
import 'package:provider/provider.dart';



class PagerBuilder {

  PagerBuilder._();

  static Widget build(Map<String, dynamic> data) {

    return ChangeNotifierProvider(
      create: (_) => PagerController(),
      child: PagerDrawer(
      children: _getChildren(data),
      ),
    );
    
  }
  
  
  
  static List _getChildren(Map<String, dynamic> data) {
    
    if (!data.containsKey("children") || data.containsKey("children") && List.from(data['children']).isEmpty) {
      return [];
    }
    
    return List<List<Map<String, dynamic>>>.from(data['children']).map((e) {
      return e.map((_) => FormCraftBuilder.build(data: _)!).toList();
    }).toList();
  }


  static PagerController _getController(Map<String, dynamic> data) {
    return PagerController(

    );
  }





}
