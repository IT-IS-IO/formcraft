
import '../interface.dart';

class IconButtonComponent extends Component {

  IconButtonComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'IconButtonComponent';
  }


  @override
  Widget get componentWidget => IconButton(
    key: uuid,
    icon: child?.widget ?? const SizedBox(),
    onPressed: () {},
  );


}