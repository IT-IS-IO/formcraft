import 'dart:math';
import 'package:flutter/material.dart';

class PagerUtils {


  static List<ScrollPosition> getScrollPositions(PageController controller) {
    return controller.positions.toList();
  }


  static int calculateCount(Iterable<ScrollPosition> positions) {
    final maxScrollExtent = positions.map((p) => p.maxScrollExtent).reduce(max);
    final viewportDimension = positions.map((p) => p.viewportDimension).reduce(max);
    return (maxScrollExtent / viewportDimension).floor();
  }


  static int calculatePageCount(PageController controller) {
    final positions = getScrollPositions(controller);
    return calculateCount(positions);
  }


  static int getCurrentPage(PageController controller) {
    return controller.page?.toInt() ?? 0;
  }


  static Future<void> changePage(PageController controller, bool next) async {

    final method = next ? controller.nextPage : controller.previousPage;
    final limit = next ? controller.positions.last.maxScrollExtent : controller.positions.first.minScrollExtent;

    if (controller.page != limit) {
      await method(duration: const Duration(milliseconds: 180), curve: Curves.fastOutSlowIn);
    }

  }


  static bool isMaxExtent(PageController controller) {
    return controller.position.maxScrollExtent.ceil() == controller.position.pixels.ceil();
  }


  static bool isMinExtent(PageController controller) {
    return controller.position.minScrollExtent.ceil() == controller.position.pixels.ceil();
  }


  static bool canForward(PageController controller, bool next) {
    return next
        ? getCurrentPage(controller) < controller.positions.last.maxScrollExtent
        : getCurrentPage(controller) > controller.positions.first.minScrollExtent;
  }


}