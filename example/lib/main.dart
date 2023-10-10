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
            "type": "grid",
            "widget": "column",
            "children": [
              {
                "type": "grid",
                "widget": "container",
                "child": {
                  "type": "form",
                  "name": "FormCraft",
                  "child": {
                    "type": "input",
                    "name": "FormCraftInput",
                    "form": "FormCraft",
                    "initialValue": "Hello World!",
                    "events": [
                      {
                        "type": "condition",
                        "conditions": [
                          {
                            "type": "equals",
                            "value": "[FormCraft.FormCraftInput2]",
                            "then": [
                              {
                                "type": "message",
                                "message_type": "snackbar",
                                "message": "Hello World!",
                              },
                              {
                                "type": "change_field",
                                "change": "[form.FormCraftInput.FormCraftInput2]",
                                "to": "Changed This"
                              }
                            ]
                          },
                          {
                            "type": "or",
                            "value": "Hello",
                            "then": [
                              {
                                "type": "message",
                                "message_type": "snackbar",
                                "message": "HEHEHEHEHE",
                              },
                              {
                                "type": "change_field",
                                "change": "[FormCraft.FormCraftInput]",
                                "to": "Hello World!"
                              }
                            ]
                          }
                        ]
                      },
                    ]
                  }
                }
              },
              {
                "type": "grid",
                "widget": "container",
                "child": {
                  "type": "input",
                  "name": "FormCraftInput2",
                  "form": "FormCraft",
                  "initialValue": ""
                }
              },
              // {
              //   "type": "grid",
              //   "widget": "container",
              //   "child": {
              //     "type": "button",
              //     "button": "text",
              //     "text": "Submit",
              //     "event.long": {
              //       "type": "submit",
              //       "method": "debug",
              //     }
              //   }
              // },
              // {
              //   "type": "button",
              //   "button": "icon",
              //   "text": "Submit",
              //   "event": {
              //     "type": "method",
              //     "method": "modal",
              //     "widget": {
              //       "type": "grid",
              //       "widget": "container",
              //       "child": {
              //         "type": "text",
              //         "title": "Hello World!"
              //       }
              //     }
              //   }
              // }
            ]
          }
        ),
      ),
    );
  }
}
