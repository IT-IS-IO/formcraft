

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldManager {

  FieldManager._();


  void awd() {


    Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          TextFormField(
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
        ],
      )
    );

  }

}