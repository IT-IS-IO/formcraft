
import '../interface.dart';

class IconButtonComponent extends Component {

  IconButtonComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'IconButtonComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = IconButton(
      key: uuid,
      icon: child?.widget ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }

  @override
  Widget get componentWidget => throw UnimplementedError();


}