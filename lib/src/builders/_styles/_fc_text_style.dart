




import 'package:flutter/material.dart' show FontWeight, TextStyle;
import 'package:formcraft/src/utils/managers/MapManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';

class TextStyleBuilder {


  static TextStyle build(Map<String, dynamic>? data) {

    if (isNull(data)) return const TextStyle();
    return const TextStyle();
    return TextStyle(
      color: MapManager.getColor('color', data!),
      fontSize: MapManager.getDouble('fontSize', data),
      fontWeight: _getFontWeight(data['weight']),
      fontStyle: data['fontStyle'],
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      height: data['height'],
      locale: data['locale'],
      foreground: data['foreground'],
      background: data['background'],
      shadows: data['shadows'],
      fontFeatures: data['fontFeatures'],
      decoration: data['decoration'],
      decorationColor: data['decorationColor'],
      decorationStyle: data['decorationStyle'],
      decorationThickness: data['decorationThickness'],
      debugLabel: data['debugLabel'],
      fontFamily: data['fontFamily'],
      fontFamilyFallback: data['fontFamilyFallback'],
      package: data['package'],
    );
  }


  static FontWeight _getFontWeight(String weight) {
    switch (weight) {
      case 'w100': return FontWeight.w100;
      case 'w200': return FontWeight.w200;
      case 'w300': return FontWeight.w300;
      case 'w400': return FontWeight.w400;
      case 'w500': return FontWeight.w500;
      case 'w600': return FontWeight.w600;
      case 'w700': return FontWeight.w700;
      case 'w800': return FontWeight.w800;
      case 'w900': return FontWeight.w900;
      case 'normal': return FontWeight.normal;
      case 'bold': return FontWeight.bold;
      default: return FontWeight.normal;
    }
  }


}