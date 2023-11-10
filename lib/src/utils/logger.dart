
import 'package:flutter/foundation.dart';
import 'package:formcraft/src/other/enums/enums.dart';
import 'package:formcraft/src/other/typedefs/fc_typedefs.dart';



class Logger {

  static void log(Object object, {String? name, StackTrace? stackTrace, LoggerType level = LoggerType.ordinary, bool debug = true}) {
    logDefaultPrinter(object, name: name, stackTrace: stackTrace, level: level, debug: debug);
  }

  static void info(Object object, {String? name, StackTrace? stackTrace, bool debug = true}) {
    logDefaultPrinter(object, name: name, stackTrace: stackTrace, level: LoggerType.info, debug: debug);
  }

  static void error(Object object, {String? name, StackTrace? stackTrace, bool debug = true}) {
    logDefaultPrinter(object, name: name, stackTrace: stackTrace, level: LoggerType.error, debug: debug);
  }

  static void success(Object object, {String? name, StackTrace? stackTrace, bool debug = true}) {
    logDefaultPrinter(object, name: name, stackTrace: stackTrace, level: LoggerType.success, debug: debug);
  }

  static void warning(Object object, {String? name, StackTrace? stackTrace, bool debug = true}) {
    logDefaultPrinter(object, name: name, stackTrace: stackTrace, level: LoggerType.warning, debug: debug);
  }

  static void json(Object object, {String? name = "JSON", LoggerType level = LoggerType.json, bool debug = true}) {
    logDefaultPrinter(object, name: name, level: level, debug: debug);
  }


  static void clear() {

    // if (kIsWeb) {
    //   final JsObject console = (context['console'] as JsObject);
    //   console.callMethod('clear');
    // }

  }



}


LogPrinter logDefaultPrinter = (Object object, {String? name, StackTrace? stackTrace, LoggerType? level = LoggerType.ordinary, bool debug = true}) {

  // if (!debug) return;

  String _coloredString(String string) {
    switch (level) {
      case LoggerType.ordinary:
        return '\u001b[90m$string\u001b[0m';
      case LoggerType.info:
        return '\u001B[34m$string\u001b[0m';
      case LoggerType.warning:
        return '\u001b[33m$string\u001b[0m';
      case LoggerType.error:
        return '\u001b[31m$string\u001b[0m';
      case LoggerType.success:
        return '\u001b[32m$string\u001b[0m';
      case LoggerType.json:
        return '\u001b[36m$string\u001b[0m';
      default:
        return '\u001b[90m$string\u001b[0m';
    }
  }

  String _prepareName() {
    if (name == null) return "";
    return "[$name] ";
  }

  String _prepareObject() {
    switch (level) {
      case LoggerType.ordinary:
        return _coloredString('${_prepareName()}[DEBUG] ${object.toString()}');
      case LoggerType.info:
        return _coloredString('${_prepareName()}[INFO] ${object.toString()}');
      case LoggerType.warning:
        return _coloredString('${_prepareName()}[WARNING] ${object.toString()}');
      case LoggerType.error:
        return _coloredString('${_prepareName()}[ERROR] ${object.toString()}');
      case LoggerType.success:
        return _coloredString('${_prepareName()}[SUCCESS] ${object.toString()}');
      default:
        return _coloredString('${_prepareName()}${object.toString()}');
    }
  }

  void _preparePrinter(Object object) {
    switch (level) {
      case LoggerType.ordinary:
        return debugPrint(object.toString());
      case LoggerType.info:
        return debugPrint(object.toString());
      case LoggerType.warning:
        return debugPrint(object.toString());
      case LoggerType.error:
        return debugPrint(object.toString());
      case LoggerType.success:
        return debugPrint(object.toString());
      default:
        return debugPrint(object.toString());
    }
  }

  _preparePrinter(_prepareObject());

  if (stackTrace != null) {
    debugPrint(_coloredString('__________________________________'));
    debugPrint(_coloredString('${stackTrace.toString()}'));
  }

};
