
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_functions/function_builder.dart';
import 'package:formcraft/src/managers/MapManager.dart';
import 'package:formcraft/src/utils/methods/methods.dart';


enum EventType {

  double,

  long,

  hover,

  event

}


class ButtonBuilder {

  const ButtonBuilder._();

  static Widget build(Map<String, dynamic> data) {
    return switch (MapManager.getAsString("button", data)) {
      "text" => _buildTextButton(data),
      "icon" => _buildIconButton(data),
      "elevated" => _buildElevatedButton(data),
      "outlined" => _buildOutlinedButton(data),
      _ => _buildTextButton(data),
    };
  }

  static Widget _buildTextButton(Map<String, dynamic> data) {
    return TextButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(MapManager.getAsString("text", data)),
    );
  }

  static Widget _buildIconButton(Map<String, dynamic> data) {
    return IconButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      icon: const Icon(Icons.add),
    );
  }

  static Widget _buildElevatedButton(Map<String, dynamic> data) {
    return ElevatedButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(MapManager.getAsString("text", data)),
    );
  }

  static Widget _buildOutlinedButton(Map<String, dynamic> data) {
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
