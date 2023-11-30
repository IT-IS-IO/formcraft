
import 'package:formcraft/src/components/interfaces/component_interface.dart';

export 'package:flutter/material.dart';

abstract class FieldComponent extends Component {


  FieldComponent({ Map<String, dynamic> attributes = const { } }) : super(attributes: attributes);



  void updateValue(dynamic value) {
    listener.updateValue(value);
  }


  void changeValue(dynamic value) {
    listener.changeValue(value);
  }


  dynamic get value => listener.value;


  void validate() {
    listener.validate();
  }


  void subscribeToListener(List<FieldComponent> listenerComponent) {

    // if (listener == null) {
    //   throw Exception("FieldComponent: listener is null");
    // }
    // else {
    //   // TODO: create a single field bloc
    // }

    // listener!.subscribeTolisteners(listenerComponent.map((e) => e.listener!).toList());

  }


}