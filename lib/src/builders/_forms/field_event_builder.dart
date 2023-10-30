//
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:form_bloc/form_bloc.dart';
// import 'package:formcraft/src/utils/classes/ValueUtil.dart';
// import 'package:formcraft/src/managers/StateManager.dart';
// import 'package:formcraft/src/utils/methods/methods.dart';
// import 'package:formcraft/src/utils/typedefs/fc_event_typedefs.dart';
//
//
//
// class FieldEventBuilder {
//
//
//   static OnValueChange onValueChange({ required Map<String, dynamic> data }) {
//     return (FieldBlocState<dynamic, dynamic, dynamic> previous, FieldBlocState<dynamic, dynamic, dynamic> current) async* {
//
//       for (Map<String, dynamic> event in ValueUtil.getList("events", data)) _buildEvent(data: event);
//
//      };
//   }
//
//
//
//   static void _buildEvent({ required Map<String, dynamic> data }) {
//     switch (ValueUtil.getAsString("type", data)) {
//       case "condition": _buildConditions(data: data); break;
//       // case "message": _buildMessage(data: data); break;
//       default: break;
//     }
//   }
//
//
//   static void _buildConditions({ required Map<String, dynamic> data }) {
//
//     // conditions: [{type: equals, value: [FormCraft.FormCraftInput2], then: [{type: message, message_type: snackbar, message: Hello World!}, {type: change_field, change: [form.FormCraftInput.FormCraftInput2], to: Changed This}]}, {type: or, value: Hello, then: [{type: message, message_type: snackbar, message: HEHEHEHEHE}, {type: change_field, change: [FormCraft.FormCraftInput], to: Hello World!}]
//
//     List<Map<String, dynamic>> conditions = ValueUtil.getList("conditions", data);
//
//     for (Map<String, dynamic> condition in conditions)
//       _buildCondition(data: condition);
//
//
//
//   }
//
//
//   static void _buildCondition({ required Map<String, dynamic> data }) {
//     print("data: $data");
//
//     if (data.containsKey("value")) {
//       String value = ValueUtil.getAsString("value", data);
//       if (value.contains("[")) {
//         String key = value.replaceAll("[", "").replaceAll("]", "");
//         if (StateManager.hasField(key)) {
//           SingleFieldBloc? field = StateManager.fieldManager.get(key);
//           if (!isNull(field)) {
//             field!.onValueChanges(onData: (FieldBlocState<dynamic, dynamic, dynamic> oldState, FieldBlocState<dynamic, dynamic, dynamic> newState) async* {
//               print("oldState: $oldState");
//               print("newState: $newState");
//             });
//           }
//         }
//       }
//     }
//   }
//
//
//   static void _buildEqualsCondition({ required Map<String, dynamic> data }) {
//     print("data2222: $data");
//
//     if (data.containsKey("value")) {
//       String value = ValueUtil.getAsString("value", data);
//       if (value.contains("[")) {
//         String key = value.replaceAll("[", "").replaceAll("]", "");
//         if (StateManager.hasField(key)) {
//           // SingleFieldBloc? field = StateManager.fo.get(key);
//           // if (!isNull(field)) {
//           //   field!.onValueChanges(onData: (FieldBlocState<dynamic, dynamic, dynamic> oldState, FieldBlocState<dynamic, dynamic, dynamic> newState) async* {
//           //     print("oldState: $oldState");
//           //     print("newState: $newState");
//           //   });
//           // }
//         }
//       }
//     }
//   }
//
//   static void _buildOrCondition({ required Map<String, dynamic> data }) {
//     print("data: $data");
//
//     if (data.containsKey("value")) {
//       String value = ValueUtil.getAsString("value", data);
//       if (value.contains("[")) {
//         String key = value.replaceAll("[", "").replaceAll("]", "");
//         if (StateManager.hasField(key)) {
//           SingleFieldBloc? field = StateManager.fieldManager.get(key);
//           if (!isNull(field)) {
//             field!.onValueChanges(onData: (FieldBlocState<dynamic, dynamic, dynamic> oldState, FieldBlocState<dynamic, dynamic, dynamic> newState) async* {
//               print("oldState: $oldState");
//               print("newState: $newState");
//             });
//           }
//         }
//       }
//     }
//   }
//
//   // "events": [
// //                         {
// //                           "type": "condition",
// //                           "conditions": [
// //                             {
// //                               "type": "equals",
// //                               "value": "[FormCraft.FormCraftInput2]",
// //                               "then": [
// //                                 {
// //                                   "type": "message",
// //                                   "message_type": "snackbar",
// //                                   "message": "Hello World!",
// //                                 },
// //                                 {
// //                                   "type": "change_field",
// //                                   "change": "[form.FormCraftInput.FormCraftInput2]",
// //                                   "to": "Changed This"
// //                                 }
// //                               ]
// //                             },
// //                             {
// //                               "type": "or",
// //                               "value": "Hello",
// //                               "then": [
// //                                 {
// //                                   "type": "message",
// //                                   "message_type": "snackbar",
// //                                   "message": "HEHEHEHEHE",
// //                                 },
// //                                 {
// //                                   "type": "change_field",
// //                                   "change": "[FormCraft.FormCraftInput]",
// //                                   "to": "Hello World!"
// //                                 }
// //                               ]
// //                             }
// //                           ]
// //                         },
// //                       ]
//
//
//
//
//
//
//
//
// }