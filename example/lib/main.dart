import 'package:flutter/material.dart';
import 'package:formcraft/formcraft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Center(
        child: FormCraft(
          data: {
            "type": "scaffold",
            "appbar": {
              "title": "FormCraft",
              // "backgroundColor": "#000",
              // "titleColor": "#fff"
            },
            "child": {
              "type": "column",
              "children": [
                {
                  "type": "container",
                  "child": {
                    "type": "form",
                    "name": "FormCraft",
                    "child": {
                      "type": "input",
                      "name": "FormCraftInput",
                      "form": "FormCraft",
                      "initialValue": "Hello World!"
                    }
                  }
                },
                {
                  "type": "container",
                  "child": {
                    "type": "form",
                    "name": "FormCraft2",
                    "child": {
                      "type": "input",
                      "name": "FormCraftInput",
                      "form": "FormCraft2",
                      "initialValue": ""
                    }
                  }
                },
                {
                  "type": "container",
                  "child": {
                    "type": "input",
                    "name": "FormCraftInput12",
                    "form": "FormCraft",
                    "initialValue": "Hello FormCraft!"
                  }
                },
              ]
            }
            // "color": "#000"
          },
        ),
      ),
    );
  }
}
