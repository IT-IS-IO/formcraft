
import '../interface.dart';

class IconButtonComponent extends Component {

  IconButtonComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

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