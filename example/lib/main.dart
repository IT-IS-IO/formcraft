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
              // <action-attrs name="action-test">
              //   <attribute ... if="code == 'some'" expr="eval: __self__?.customer?.fullName" />
              //   <attribute ... if="#{code == 'some'}" expr="#{ __self__.customer.fullName }" />
              //   <attribute ... expr="call: com.axelor.contact.SomeController:method" />
              //   <attribute ... expr="select: s.fullName from Contact s where s.code = :code" />
              // </action-attrs>
              "actions": [
                {
                  "name": "action-test",
                  "attributes": [
                    {
                      "name": "attribute",
                      "if": "[FormCraft.FormCraftInput] == 'some'",
                      "expr": "eval: [FormCraft.FormCraftInput765]"
                    },
                    {
                      "name": "attribute",
                      "if": "#{code == 'some'}",
                      "expr": "#{ __self__.customer.fullName }"
                    },
                    {
                      "name": "attribute",
                      "expr": "call: com.axelor.contact.SomeController:method"
                    },
                    {
                      "name": "attribute",
                      "expr": "select: s.fullName from Contact s where s.code = :code"
                    }
                  ]
                }
              ],
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
                          "logic": [
                            {
                              "name": "Update Values: Animals",
                              "trigger": {
                                "type": "simple",
                                "simple": {
                                  "show": true,
                                  "when": "age",
                                  "eq": "a"
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
                                  "when": "age",
                                  "eq": "b"
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
