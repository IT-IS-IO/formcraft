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
            "type": "custom",
            "widget": "pager",
            "children": [
              [
                {
                  "type": "grid",
                  "widget": "container",
                  "child": {
                    "type": "grid",
                    "widget": "column",
                    "children": [
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInput",
                        "initialValue": "Hello World!",
                      },
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInput2",
                        "initialValue": ""
                      }
                    ]
                  },
                }
              ],
              [
                {
                  "type": "grid",
                  "widget": "container",
                  "child": {
                    "type": "grid",
                    "widget": "column",
                    "children": [
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1",
                        "initialValue": "Hello World!",
                      },
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu13",
                        "initialValue": ""
                      }
                    ]
                  },
                },
                {
                  "type": "grid",
                  "widget": "container",
                  "child": {
                    "type": "grid",
                    "widget": "column",
                    "children": [
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1222",
                        "initialValue": "Hello World!",
                      },
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1121231",
                        "initialValue": ""
                      }
                    ]
                  },
                },
                {
                  "type": "grid",
                  "widget": "container",
                  "child": {
                    "type": "grid",
                    "widget": "column",
                    "children": [
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1124124",
                        "initialValue": "Hello World!",
                      },
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1124124",
                        "initialValue": ""
                      }
                    ]
                  },
                }
              ],
              [
                {
                  "type": "grid",
                  "widget": "container",
                  "child": {
                    "type": "grid",
                    "widget": "column",
                    "children": [
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu11212124124",
                        "initialValue": "Hello World!",
                      },
                      {
                        "type": "form",
                        "widget": "input",
                        "form": "FormCraft",
                        "name": "FormCraftInpu1124124",
                        "initialValue": ""
                      }
                    ]
                  },
                }
              ],
            ]
          }
        ),
      ),
    );
  }


}
