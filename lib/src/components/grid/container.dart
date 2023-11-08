
import '../interface.dart';


class ContainerComponent extends Component {


  @override
  String get type {
    return 'ContainerComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    attributes.addAll(data);

    widget = Container(
      key: uuid,
      child: child?.widget ?? const SizedBox(),
    );

    return widget;

  }


}