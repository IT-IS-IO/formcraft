

import 'package:formcraft/src/components/interfaces/component_interface.dart';

class RichTextComponent extends Component {


  RichTextComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);


  @override
  String get type {
    return 'RichTextComponent';
  }


  void changeText(String text) {
    attributes["data"] = text;
  }


  @override
  void addChild(Component? _child) {
    throw "$type cannot have children.";
  }

  @override
  Widget get componentWidget => RichText(
    text: attributes["data"] ?? "",
    key: key,
  );


}