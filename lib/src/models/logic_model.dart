

// class LogicCondition {
//
//   final bool show;
//   final String when;
//   final String eq;
//
//   LogicCondition({
//     required this.show,
//     required this.when,
//     required this.eq,
//   });
//
//
//   factory LogicCondition.fromJson(Map<String, dynamic> data) {
//     return LogicCondition(
//       show: data["show"] ?? false,
//       when: data["when"] ?? "",
//       eq: data["eq"] ?? "",
//     );
//   }
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       "show": show,
//       "when": when,
//       "eq": eq,
//     };
//   }
//
//
// }