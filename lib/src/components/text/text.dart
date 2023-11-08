
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';

class TextComponent extends Component {


  @override
  String get type {
    return 'TextComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    widget = Text(
      attributes["data"] ?? "",
      key: uuid,
    );

    return widget;

  }


  void changeText(String text) {
    attributes["data"] = text;
  }



}