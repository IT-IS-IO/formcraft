
import 'package:formcraft/src/components/interfaces/component_interface.dart';


class ContainerComponent extends Component {

  ContainerComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);


  @override
  String get type {
    return 'ContainerComponent';
  }


  @override
  Widget get componentWidget => Container(
    key: key,
    child: child?.widget ?? const SizedBox(),
  );


}