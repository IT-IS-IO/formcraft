
import '../interface.dart';

class RichTextComponent extends Component {


  RichTextComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'RichTextComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

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
    key: uuid,
  );


}