
import 'package:flutter/material.dart';


class AlignBuilder {

  const AlignBuilder._();


  static Alignment alignment(String alignment) {
    return switch (alignment) {
      "center" => Alignment.center,
      "topCenter" => Alignment.topCenter,
      "bottomCenter" => Alignment.bottomCenter,
      "centerLeft" => Alignment.centerLeft,
      "centerRight" => Alignment.centerRight,
      "topLeft" => Alignment.topLeft,
      "topRight" => Alignment.topRight,
      "bottomLeft" => Alignment.bottomLeft,
      "bottomRight" => Alignment.bottomRight,
      _ => Alignment.center,
    };
  }


  static CrossAxisAlignment crossAxisAlignment(String alignment) {
    return switch (alignment) {
      "center" => CrossAxisAlignment.center,
      "start" => CrossAxisAlignment.start,
      "end" => CrossAxisAlignment.end,
      "stretch" => CrossAxisAlignment.stretch,
      "baseline" => CrossAxisAlignment.baseline,
      _ => CrossAxisAlignment.center,
    };
  }


  static MainAxisAlignment mainAxisAlignment(String alignment) {
    return switch (alignment) {
      "center" => MainAxisAlignment.center,
      "start" => MainAxisAlignment.start,
      "end" => MainAxisAlignment.end,
      "spaceAround" => MainAxisAlignment.spaceAround,
      "spaceBetween" => MainAxisAlignment.spaceBetween,
      "spaceEvenly" => MainAxisAlignment.spaceEvenly,
      _ => MainAxisAlignment.center,
    };
  }


  static MainAxisSize mainAxisSize(String alignment) {
    return switch (alignment) {
      "min" => MainAxisSize.min,
      "max" => MainAxisSize.max,
      _ => MainAxisSize.max,
    };
  }


  static Axis direction(String alignment) {
    return switch (alignment) {
      "horizontal" => Axis.horizontal,
      "vertical" => Axis.vertical,
      _ => Axis.horizontal,
    };
  }

}