
import '../interface.dart';

class RichTextComponent extends Component {



  @override
  String get type {
    return 'RichTextComponent';
  }



  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    widget = RichText(
      text: attributes["data"] ?? "",
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