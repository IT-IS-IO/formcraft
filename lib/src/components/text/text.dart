
import '../interface.dart';

class TextComponent extends Component {

  TextComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'TextComponent';
  }


  void changeText(String text) {
    attributes["data"] = text;
  }

  @override
  void addChild(Component? child) {
    throw "$type cannot have children.";
  }


  @override
  Widget get componentWidget => Text(
    attributes["data"] ?? "",
    key: uuid,
  );

}