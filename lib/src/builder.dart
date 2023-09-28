
import 'package:flutter/material.dart';

class FormCraftBuilder extends StatefulWidget {

  const FormCraftBuilder({ super.key });

  @override
  State<FormCraftBuilder> createState() => _FormCraftBuilderState();
}

class _FormCraftBuilderState extends State<FormCraftBuilder> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3), () => 'data'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
