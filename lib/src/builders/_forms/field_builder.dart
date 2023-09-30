
import 'package:flutter/material.dart';



class FieldBuilder {

  static const IDENTITY_KEY = "field";

  static Widget build({ required Map<String, dynamic> data }) {

    switch (data[IDENTITY_KEY]) {
      default: return const Text("Hello World");
    }

  }



}