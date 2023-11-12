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
              "name": "FormCraft",
              "type": "form",
              "build": {
                "component": "column",
                "children": [
                  {
                    "component": "container",
                    "child": {
                      "component": "column",
                      "mainAxisAlignment": "center",
                      "crossAxisAlignment": "center",
                      "children": [
                        {
                          "component": "textField",
                          "key": "FormCraftInput",
                          "initialValue": "Hello World!",
                        },
                        {
                          "component": "groupRadio",
                          "key": "FormCraftRadioGroup",
                          "values": [
                            {
                              "value": "1",
                              "label": "One"
                            },
                            {
                              "value": "2",
                              "label": "Two"
                            },
                            {
                              "value": "3",
                              "label": "Three"
                            }
                          ],
                          "logic": [
                            {
                              "name": "Update Values: Animals",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "FormCraftCheckboxGroup",
                                  "eq": "hello"
                                }
                              },
                              "actions": [
                                {
                                  "name": "Schema Update",
                                  "type": "mergeComponentSchema",
                                  "schemaDefinition": "schema = {values:[{label: 'Cat', value: 'cat'}, {label:'Dog', value: 'dog'}]};"
                                }
                              ]
                            },
                            {
                              "name": "Update Values: Animals",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "FormCraftInput",
                                  "eq": "hello"
                                }
                              },
                              "actions": [
                                {
                                  "name": "Schema Update",
                                  "type": "mergeComponentSchema",
                                  "schemaDefinition": "schema = {values:[{label: 'Cat', value: 'cat'}, {label:'Dog', value: 'dog'}]};"
                                }
                              ]
                            },
                            {
                              "name": "Update Values: Fruits",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "FormCraftInput",
                                  "eq": "imo"
                                }
                              },
                              "actions": [
                                {
                                  "name": "Update fruit",
                                  "type": "mergeComponentSchema",
                                  "schemaDefinition": "schema = {values:[{label: 'Apple', value: 'apple'}, {label:'Banana', value: 'banana'}]};"
                                }
                              ]
                            }
                          ],
                        },
                        {
                          "component": "checkbox",
                          "key": "FormCraftCheckbox",
                          "label": "Hey! It's warioddly"
                        },
                        {
                          "component": "groupCheckbox",
                          "key": "FormCraftCheckboxGroup",
                          "values": [
                            {
                              "value": "1",
                              "label": "One"
                            },
                            {
                              "value": "2",
                              "label": "Two"
                            },
                            {
                              "value": "3",
                              "label": "Three"
                            }
                          ]
                        },
                        {
                          "component": "textField",
                          "key": "FormCraftInput765",
                          "initialValue": "Hello 124124124124124!",
                        },
                        {
                          "component": "text",
                          "data": "Hey! It's warioddly",
                          "logic": [
                            {
                              "name": "Update Values: Fruits",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "FormCraftInput",
                                  "eq": "imo"
                                }
                              },
                              "actions": [
                                {
                                  "name": "Update fruit",
                                  "type": "mergeComponentSchema",
                                  "schemaDefinition": "schema = {values:[{label: 'Apple', value: 'apple'}, {label:'Banana', value: 'banana'}]};"
                                }
                              ]
                            },
                            {
                              "name": "Update Values: Fruits",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "FormCraftInput",
                                  "eq": "show text"
                                }
                              },
                              "actions": [
                                {
                                  "name": "Update fruit",
                                  "type": "mergeComponentSchema",
                                  "schemaDefinition": "schema = {values:[{label: 'Apple', value: 'apple'}, {label:'Banana', value: 'banana'}]};"
                                }
                              ]
                            }
                          ]
                        }
                      ]
                    },
                  }
                ]
              }
            }
        ),
      ),
    );
  }


}
