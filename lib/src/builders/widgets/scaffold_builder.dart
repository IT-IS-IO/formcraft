

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/widgets/appbar_builder.dart';
import 'package:formcraft/src/utils/value_util.dart';

class ScaffoldBuilder {


  static Widget build({ required Map<String, dynamic> data }) {

    return Scaffold(
      appBar: AppbarBuilder.build(data: data["appbar"]),
      backgroundColor: ValueUtil.getColor("color", data),
      body: Center(child: FormCraftBuilder.build(data: data['child']))
    );

  }


}
