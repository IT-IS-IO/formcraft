
import '../interface.dart';


class ContainerComponent extends Component {

  ContainerComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'ContainerComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }

  @override
  Widget get componentWidget => Container(
    key: uuid,
    child: child?.widget ?? const SizedBox(),
  );


}