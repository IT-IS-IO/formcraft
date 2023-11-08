
import '../interface.dart';

class TextButtonComponent extends Component {

  TextButtonComponent() : super();

  @override
  String get type {
    return 'TextButtonComponent';
  }


  @override
  Widget? render({ required Map<String, dynamic> data }) {

    super.render(data: data);

    widget = TextButton(
      key: uuid,
      child: child?.widget ?? const SizedBox(),
      onPressed: () {},
    );

    return widget;

  }



}