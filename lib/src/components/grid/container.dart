
import '../interface.dart';


class ContainerComponent extends Component {

  ContainerComponent() : super();

  @override
  String get type {
    return 'ContainerComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    super.render(data: data);

    widget = Container(
      key: uuid,
      child: child?.widget ?? const SizedBox(),
    );

    return widget;

  }


}