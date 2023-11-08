
import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';


class ColumnComponent extends Component {


  @override
  String get type {
    return 'ColumnComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    uuid = buildUniqueKey(data);

    widget = Column(
      key: uuid,
      mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: children,
    );

    return widget;

  }


  void addChild(Widget child) {
    children.add(child);
  }


}