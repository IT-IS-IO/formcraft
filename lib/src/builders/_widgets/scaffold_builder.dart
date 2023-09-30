

import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/builders/_widgets/appbar_builder.dart';
import 'package:formcraft/src/utils/managers/MapManager.dart';

class ScaffoldBuilder extends BuilderAbstract {


  static Widget build({ required Map<String, dynamic> data }) {

    return Scaffold(
      appBar: AppbarBuilder.build(data: data["appbar"]),
      backgroundColor: MapManager.getColor("color", data),
      body: Center(child: FormCraftBuilder.build(data: data['child']))
    );

  }


}
