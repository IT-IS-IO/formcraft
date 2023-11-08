
import '../interface.dart';

class IconButtonComponent extends Component {

  IconButtonComponent() : super();

  @override
  String get type {
    return 'IconButtonComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    super.render(data: data);

    widget = IconButton(
      key: uuid,
      icon: child?.widget ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }


}