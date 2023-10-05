
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_functions/function_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';


enum EventType {

  double,

  long,

  hover,

  event

}


class ButtonBuilder extends BuilderAbstract {

  static Widget build({ required Map<String, dynamic> data }) {

    switch (MapManager.getAsString("button", data)) {
      case "text": return _buildTextButton(data: data);
      case "icon": return _buildIconButton(data: data);
      case "elevated": return _buildElevatedButton(data: data);
      case "outlined": return _buildOutlinedButton(data: data);
      default: return const SizedBox();
    }

  }

  static Widget _buildTextButton({ required Map<String, dynamic> data }) {
    return TextButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(MapManager.getAsString("text", data)),
    );
  }

  static Widget _buildIconButton({ required Map<String, dynamic> data }) {
    return IconButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      icon: const Icon(Icons.add),
    );
  }

  static Widget _buildElevatedButton({ required Map<String, dynamic> data }) {
    return ElevatedButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(MapManager.getAsString("text", data)),
    );
  }

  static Widget _buildOutlinedButton({ required Map<String, dynamic> data }) {
    return OutlinedButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(MapManager.getAsString("text", data)),
    );
  }


  static Function()? _getEvent({ required Map<String, dynamic> data, EventType? type }) {

    if (MapManager.has("event", data) && (isNull(type) || type == EventType.event))  {
      return FunctionBuilder.build(data: data["event"]);
    }

    if (MapManager.has("event.double", data) && type == EventType.double) {
      return FunctionBuilder.build(data: data['event.double']);
    }

    if (MapManager.has("event.long", data) && type == EventType.long) {
      return FunctionBuilder.build(data: data['event.long']);
    }

    // if (MapManager.has("event.hover", data) && type == EventType.hover) {
    //   return FunctionBuilder.build(data: data['hover.event']);
    // }

    return null;
  }


}
