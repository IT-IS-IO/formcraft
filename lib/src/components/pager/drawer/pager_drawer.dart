//MIT License
//
// Copyright (c) 2023 WARIODDLY
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:flutter/material.dart';
import 'package:formcraft/src/components/pager/core/configs/pager_config.dart';
import 'package:formcraft/src/components/pager/core/controllers/pager_controller.dart';
import 'package:formcraft/src/components/pager/drawer/pager.dart';
import 'package:provider/provider.dart';
export 'package:expandable_page_view/expandable_page_view.dart';

class PagerDrawer extends StatefulWidget {

  const PagerDrawer({
    Key? key,
    required this.children,
  }) : assert(children.length != 0, 'У вас нету дочерних страниц'), super(key: key);


  final List<dynamic> children;


  @override
  State<StatefulWidget> createState() => _PagerDrawerState();
}

class _PagerDrawerState extends State<PagerDrawer> {


  List<Widget> pagers = [];

  final PagerConfig config = const PagerConfig();
  late final PagerController controller;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller = Provider.of<PagerController>(context, listen: false);
    initChildPagers(widget.children as List<List<Widget>>);

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [ BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.08),
          blurRadius: 14,
          offset: Offset(0, 2),
        ) ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Pager(
        controller: controller.pageController,
        animationDuration: config.animationDuration,
        alignment: config.alignment,
        keepAlive: config.keepAlive,
        physics: config.parentPhysics,
        children: pagers,
      )
    );

  }


  void initChildPagers(List<List<Widget>> children) {

    for (int index = 0; index < children.length; index++) {

      pagers.add(Pager(
        controller: controller.getChildPageController(index),
        keepAlive: config.keepAlive,
        physics: config.childrenPhysics,
        alignment: config.alignment,
        animationDuration: config.animationDuration,
        children: children[index],
      ));

    }

  }


}