
import 'package:formcraft/src/components/interfaces/component_interface.dart';

class TextButtonComponent extends Component {

  TextButtonComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'TextButtonComponent';
  }


  @override
  Widget get componentWidget => TextButton(
    key: key,
    child: child?.widget ?? const SizedBox(),
    onPressed: () {},
  );



}