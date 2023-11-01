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
                "type": "custom",
                "widget": "pager",
                "debug": true,
                "children": [
                  {
                    "title": "Page 1",
                    "children": [
                      {
                        "type": "grid",
                        "widget": "container",
                        "child": {
                          "type": "grid",
                          "widget": "column",
                          "mainAxisAlignment": "center",
                          "crossAxisAlignment": "center",
                          "children": [
                            {
                              "type": "text",
                              "widget": "text",
                              "data": "Hey! It's warioddly",
                            },
                            {
                              "type": "form",
                              "widget": "input",
                              "form": "FormCraft",
                              "name": "FormCraftInput",
                              "actions": "action-test",
                              "initialValue": "Hello World!",
                            },
                            {
                              "type": "form",
                              "widget": "radioGroup",
                              "form": "FormCraft",
                              "name": "FormCraftRadioGroup",
                              "items": [
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
                              "type": "form",
                              "widget": "checkbox",
                              "form": "FormCraft",
                              "name": "FormCraftCheckbox",
                              "body": {
                                "type": "text",
                                "widget": "text",
                                "data": "Hey! It's warioddly",
                              },
                            },
                            {
                              "type": "form",
                              "widget": "checkboxGroup",
                              "form": "FormCraft",
                              "name": "FormCraftCheckboxGroup",
                              "items": [
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
                              "type": "form",
                              "widget": "input",
                              "form": "FormCraft",
                              "name": "FormCraftInput765",
                              "initialValue": "Hello 124124124124124!",
                            },
                            {
                              "type": "button",
                              "widget": "text",
                              "text": {
                                "type": "text",
                                "widget": "text",
                                "data": "Hey! It's warioddly",
                              },
                              "event": {
                                "event": "debug",
                              }
                            }
                          ]
                        },
                      }
                    ]
                  },
                  {
                    "title": "Page 2",
                    "children": [
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
                            },
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
                    ]
                  },
                  {
                    "title": "Page 3",
                    "children": [
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
                  }
                ]
              }
            }
        ),
      ),
    );
  }


}
