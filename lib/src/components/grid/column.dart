
import 'package:formcraft/src/builders/styles/_fc_alignment.dart';
import 'package:formcraft/src/utils/value_util.dart';
import '../interface.dart';


class ColumnComponent extends Component {

  ColumnComponent() : super(uuid: UniqueKey());

  @override
  String get type {
    return 'ColumnComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    super.render(data: data);

    widget = Column(
      key: uuid,
      mainAxisSize: AlignBuilder.mainAxisSize(ValueUtil.getAsString("mainAxisSize", data)),
      mainAxisAlignment: AlignBuilder.mainAxisAlignment(ValueUtil.getAsString("mainAxisAlignment", data)),
      crossAxisAlignment: AlignBuilder.crossAxisAlignment(ValueUtil.getAsString("crossAxisAlignment", data)),
      children: childrenWidgets,
    );

    return widget;

  }


}