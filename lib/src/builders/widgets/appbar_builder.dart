
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/widgets/text_builder.dart';

class AppbarBuilder {

  const AppbarBuilder._();

  static PreferredSize? build({ required Map<String, dynamic>? data }) {

    if (data == null) return null;

    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        title: TextBuilder.build(data["title"]),
      )
    );

  }

}
