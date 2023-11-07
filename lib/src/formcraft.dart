
import 'package:flutter/material.dart';
import 'package:formcraft/src/builders/_fc_builder.dart';
import 'package:formcraft/src/managers/StateManager.dart';
import 'package:formcraft/src/utils/classes/implements/ValueUtil.dart';

class FormCraft extends StatefulWidget {

  const FormCraft({ super.key, required this.data });

  final Map<String, dynamic> data;

  @override
  State<FormCraft> createState() => _FormCraftState();
}

class _FormCraftState extends State<FormCraft> {

  late Future<Widget?> init;

  @override
  void initState() {
    super.initState();

    StateManager.hasInstance();
    StateManager.init(context, widget.data);

    init = Future.value(FormCraftBuilder.build(data: ValueUtil.get("build", widget.data)));


  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: FutureBuilder(
            future: init,
            builder: (_, AsyncSnapshot<Widget?> snapshot) {

              if (snapshot.hasData) {
                return snapshot.data ?? const Text("Hello FormCraft! (Has no data)");
              }

              if (snapshot.hasError) {
                print(snapshot.stackTrace);
                return Text(snapshot.error.toString());
              }

              return const CircularProgressIndicator();

            }
        ),
      ),
    );
  }


  @override
  void dispose() {
    StateManager.dispose();
    super.dispose();
  }


}
