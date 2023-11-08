
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';

class IconButtonComponent extends Component {


  @override
  String get type {
    return 'IconButtonComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = Key(ValueUtil.getAsString("uuid", data, defaultValue: "TextButton"));

    widget = IconButton(
      key: uuid,
      icon: child?.widget ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }


}