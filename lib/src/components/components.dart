
import 'package:formcraft/src/components/button/icon.dart';
import 'package:formcraft/src/components/button/text.dart';
import 'package:formcraft/src/components/fields/checkbox.dart';
import 'package:formcraft/src/components/fields/group_checkbox.dart';
import 'package:formcraft/src/components/fields/group_radio.dart';
import 'package:formcraft/src/components/grid/column.dart';
import 'package:formcraft/src/components/grid/container.dart';
import 'package:formcraft/src/components/grid/row.dart';
import 'package:formcraft/src/components/interface.dart';
import 'package:formcraft/src/components/text/rich.dart';
import 'package:formcraft/src/components/text/text.dart';
export 'package:flutter/material.dart';



final Map<String, Component> components = {
  RichTextComponent().type: RichTextComponent(),
  TextComponent().type: TextComponent(),
  IconButtonComponent().type: IconButtonComponent(),
  TextButtonComponent().type: TextButtonComponent(),
  ContainerComponent().type: ContainerComponent(),
  RowComponent().type: RowComponent(),
  ColumnComponent().type: ColumnComponent(),
  GroupCheckboxComponent().type: GroupCheckboxComponent(),
  GroupRadioComponent().type: GroupRadioComponent(),
  CheckboxComponent().type: CheckboxComponent(),
};

