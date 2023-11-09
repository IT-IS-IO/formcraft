
import 'package:formcraft/src/utils/value.dart';

class SelectOption {

  final String value;
  final String label;

  SelectOption({ required this.value, required this.label });

  factory SelectOption.fromJson(Map<String, dynamic> data) {
    return SelectOption(
      value: ValueUtil.getAsString("value", data),
      label: ValueUtil.getAsString("label", data, defaultValue: "Unknown"),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "value": value,
      "label": label,
    };
  }

}