
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_widgets/text_builder.dart';
import 'package:formcraft/src/utils/methods/methods.dart';


class AppbarBuilder {

  const AppbarBuilder._();

  static PreferredSize? build({ required Map<String, dynamic>? data }) {

    if (isNull(data)) return null;

    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        title: TextBuilder.build(data!["title"]),
      )
    );

  }

}
