
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/components/pager/core/controllers/pager_controller.dart';
import 'package:formcraft/src/utils/value_util.dart';
import 'package:provider/provider.dart';
import '../../components/pager/drawer/pager_drawer.dart';
import '../../components/pager/drawer/pager_navigation_drawer.dart';



class PagerBuilder {

  PagerBuilder._();

  static Widget build(Map<String, dynamic> data) {

    List children = _getChildren(data);

    return ChangeNotifierProvider(
      create: (_) => PagerController(),
      child: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: PagerDrawer(
                children: children,
              ),
            ),
          ),

          const PagerNavigationDrawer(),

        ],
      ),
    );
    
  }

  
  static List _getChildren(Map<String, dynamic> data) {
    return ValueUtil.getList('children', data).map((e) {
      return ValueUtil.getList('children', e).map((_) => FormCraftBuilder.build(data: _)!).toList();
    }).toList();
  }


}
