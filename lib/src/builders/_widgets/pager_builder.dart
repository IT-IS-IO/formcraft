
import 'package:flutter/material.dart';
import 'package:formcraft/src/addons/other/pager/drawer/pager_drawer.dart';
import 'package:formcraft/src/addons/other/pager/drawer/pager_navigation_drawer.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';
import 'package:provider/provider.dart';



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
