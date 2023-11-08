
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';

class TextButtonComponent extends Component {

  @override
  String get type {
    return 'TextButtonComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = Key(ValueUtil.getAsString("uuid", data, defaultValue: "TextButton"));

    widget = TextButton(
      key: uuid,
      child: child ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }


  void addChild(Widget child) {
    this.child = child;
  }


}