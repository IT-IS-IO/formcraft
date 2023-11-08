
import '../interface.dart';

class RichTextComponent extends Component {


  RichTextComponent() {
    uuid = UniqueKey();
  }

  @override
  String get type {
    return 'RichTextComponent';
  }



  @override
  Widget? render({ required Map<String, dynamic> data }) {
    super.render(data: data);

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
  void addChild(Component? _child) {
    throw "$type cannot have children.";
  }


}