
import 'package:formcraft/src/components/button/icon.dart';
import 'package:formcraft/src/components/button/text.dart';
import 'package:formcraft/src/components/fields/checkbox.dart';
import 'package:formcraft/src/components/fields/group_checkbox.dart';
import 'package:formcraft/src/components/fields/group_radio.dart';
import 'package:formcraft/src/components/fields/text.dart';
import 'package:formcraft/src/components/grid/column.dart';
import 'package:formcraft/src/components/grid/container.dart';
import 'package:formcraft/src/components/grid/row.dart';
import 'package:formcraft/src/components/interface.dart';
import 'package:formcraft/src/components/text/rich.dart';
import 'package:formcraft/src/components/text/text.dart';
import 'package:formcraft/src/utils/string.dart';

import '../utils/logger.dart';
export 'package:flutter/material.dart';



class ComponentFactory {

  static final Map<String, Component Function(Map<String, dynamic> data)> _components = {
    RichTextComponent().type: (_) => RichTextComponent(_),
    TextComponent().type: (_) => TextComponent(_),
    IconButtonComponent().type: (_) => IconButtonComponent(_),
    TextButtonComponent().type: (_) => TextButtonComponent(_),
    ContainerComponent().type: (_) => ContainerComponent(_),
    RowComponent().type: (_) => RowComponent(_),
    ColumnComponent().type: (_) => ColumnComponent(_),
    GroupCheckboxComponent().type: (_) => GroupCheckboxComponent(_),
    GroupRadioComponent().type: (_) => GroupRadioComponent(_),
    CheckboxComponent().type: (_) => CheckboxComponent(_),
    TextFieldComponent().type: (_) => TextFieldComponent(_),
  };

  static Component? create(Map<String, dynamic> data) {

    final String type = StringUtil.capitalize("${data['component']}Component");

    Logger.info("Component: $type");

    final factory = _components[type];

    if (factory != null) {
      return factory(data);
    }
    else {
      throw Exception("$type is not a valid component.");
    }

  }

}
