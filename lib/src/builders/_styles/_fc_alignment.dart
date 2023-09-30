






import 'package:flutter/material.dart';

class AlignmentBuilder {


  static Alignment getAlignment(String alignment) {
    switch (alignment) {
      case 'center': return Alignment.center;
      case 'topCenter': return Alignment.topCenter;
      case 'bottomCenter': return Alignment.bottomCenter;
      case 'centerLeft': return Alignment.centerLeft;
      case 'centerRight': return Alignment.centerRight;
      case 'topLeft': return Alignment.topLeft;
      case 'topRight': return Alignment.topRight;
      case 'bottomLeft': return Alignment.bottomLeft;
      case 'bottomRight': return Alignment.bottomRight;
      default: return Alignment.center;
    }
  }


  static CrossAxisAlignment getCrossAxisAlignment(String alignment) {
    switch (alignment) {
      case 'center': return CrossAxisAlignment.center;
      case 'start': return CrossAxisAlignment.start;
      case 'end': return CrossAxisAlignment.end;
      case 'stretch': return CrossAxisAlignment.stretch;
      case 'baseline': return CrossAxisAlignment.baseline;
      default: return CrossAxisAlignment.center;
    }
  }


  static MainAxisAlignment getMainAxisAlignment(String alignment) {
    switch (alignment) {
      case 'center': return MainAxisAlignment.center;
      case 'start': return MainAxisAlignment.start;
      case 'end': return MainAxisAlignment.end;
      case 'spaceAround': return MainAxisAlignment.spaceAround;
      case 'spaceBetween': return MainAxisAlignment.spaceBetween;
      case 'spaceEvenly': return MainAxisAlignment.spaceEvenly;
      default: return MainAxisAlignment.center;
    }
  }


  static MainAxisSize getMainAxisSize(String alignment) {
    switch (alignment) {
      case 'min': return MainAxisSize.min;
      case 'max': return MainAxisSize.max;
      default: return MainAxisSize.max;
    }
  }


}