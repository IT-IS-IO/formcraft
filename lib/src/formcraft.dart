
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';


class FormCraft extends StatefulWidget {

  const FormCraft({ super.key, required this.data });

  final Map<String, dynamic> data;

  @override
  State<FormCraft> createState() => _FormCraftState();
}

class _FormCraftState extends State<FormCraft> {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FormCraftBuilder.asyncBuild(data: widget.data),
      builder: (_, AsyncSnapshot<Widget> snapshot) {

        if (snapshot.hasData) return snapshot.data!;

        if (snapshot.hasError) {
          print(snapshot.stackTrace);
          return Text(snapshot.error.toString());
        }

        return const CircularProgressIndicator();

      }
    );
  }

}
