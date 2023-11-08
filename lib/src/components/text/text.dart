
import '../interface.dart';

class TextComponent extends Component {


  @override
  String get type {
    return 'TextComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {
    super.render(data: data);

    widget = Text(
      attributes["data"] ?? "",
      key: uuid,
    );

    return widget;

  }


  void changeText(String text) {
    attributes["data"] = text;
  }

  @override
  void addChild(Component? child) {
    throw "$type cannot have children.";
  }

}