
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';


class ContainerComponent extends Component {


  @override
  String get type {
    return 'ContainerComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    widget = Container(
      key: uuid,
      child: child ?? const SizedBox(),
    );

    return widget;

  }


  void addChild(Widget child) {
    this.child = child;
  }


}