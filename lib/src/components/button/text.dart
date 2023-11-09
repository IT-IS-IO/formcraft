
import '../interface.dart';

class TextButtonComponent extends Component {

  TextButtonComponent([
    Map<String, dynamic> attributes = const {},
    Key? uuid,
  ]) : super(
      attributes: attributes,
      uuid: uuid
  );

  @override
  String get type {
    return 'TextButtonComponent';
  }


  @override
  Widget? render({ Map<String, dynamic>? data }) {

    super.render(data: data);

    widget = TextButton(
      key: uuid,
      child: child?.widget ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }

  @override
  Widget get componentWidget => throw UnimplementedError();



}