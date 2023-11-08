
import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';


class RowComponent extends Component {


  @override
  String get type {
    return 'RowComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    attributes.addAll(data);

    widget = Row(
      key: uuid,
      mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: childrenWidgets,
    );

    return widget;

  }


}