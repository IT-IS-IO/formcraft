
import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/components/interfaces/component_interface.dart';
import 'package:formcraft/src/utils/value.dart';


class ColumnComponent extends Component {

  ColumnComponent([ Map<String, dynamic> attributes = const { } ]) : super(attributes: attributes);

  @override
  String get type {
    return 'ColumnComponent';
  }


  @override
  Widget get componentWidget => Column(
    key: key,
    mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", attributes)),
    mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", attributes)),
    crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", attributes)),
    children: children,
  );

}