
import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/value.dart';
import '../interface.dart';


class RowComponent extends Component {

  RowComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'RowComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = componentWidget;

    return widget;

  }

  @override
  Widget get componentWidget => Row(
    key: uuid,
    mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", attributes)),
    mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", attributes)),
    crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", attributes)),
    children: children,
  );


}