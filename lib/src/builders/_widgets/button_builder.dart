
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_events/function_builder.dart';
import 'package:formcraft/src/builders/_widgets/text_builder.dart';
import 'package:formcraft/src/utils/classes/ValueUtil.dart';
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
    return switch (ValueUtil.getAsString("button", data)) {
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
      child: TextBuilder.build(ValueUtil.get("text", data)),
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
      child: Text(ValueUtil.getAsString("text", data)),
    );
  }

  static Widget _buildOutlinedButton(Map<String, dynamic> data) {
    return OutlinedButton(
      onPressed: _getEvent(data: data, type: EventType.event),
      onLongPress: _getEvent(data: data, type: EventType.long),
      child: Text(ValueUtil.getAsString("text", data)),
    );
  }


  static Function()? _getEvent({ required Map<String, dynamic> data, EventType? type }) {

    if (ValueUtil.has("event", data) && (isNull(type) || type == EventType.event))  {
      return FunctionBuilder.build(data: data["event"]);
    }

    if (ValueUtil.has("event.double", data) && type == EventType.double) {
      return FunctionBuilder.build(data: data['event.double']);
    }

    if (ValueUtil.has("event.long", data) && type == EventType.long) {
      return FunctionBuilder.build(data: data['event.long']);
    }

    // if (ValueUtil.has("event.hover", data) && type == EventType.hover) {
    //   return FunctionBuilder.build(data: data['hover.event']);
    // }

    return null;
  }


}
