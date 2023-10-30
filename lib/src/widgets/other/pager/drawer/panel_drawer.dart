//
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:uved/presentation/pages/preliminary_informing/controllers/pi_progress_controller.dart';
// import 'package:uved/presentation/widgets/layouts/addons/layouts/persistant_header_delegate_addon.dart';
// import '../../stepper/percent_stepper.dart';
// import '../../stepper/stepper_step_addon.dart';
//
//
// class PanelDrawer extends StatefulWidget {
//
//   const PanelDrawer({ Key? key, required this.controller }) : super(key: key);
//
//   final ExpandableController controller;
//
//   @override
//   State<StatefulWidget> createState() => _PanelDrawerState();
// }
//
// class _PanelDrawerState extends State<PanelDrawer> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     double maxWidth = 820.0;
//     PiProgressController controller = Provider.of<PiProgressController>(context);
//
//     Size screenSize = MediaQuery.of(context).size;
//     DeviceScreenType deviceScreenType = getDeviceType(screenSize);
//     bool isDesktop = deviceScreenType == DeviceScreenType.desktop;
//
//     double padding = getPadding(deviceScreenType);
//
//     double cardWidth = isDesktop ? 400 : deviceScreenType == DeviceScreenType.tablet ? 120.0 : 82.0;
//
//     double cardMaxWidth = (cardWidth + (12 * 2)) * controller.items.length;
//     double mediaQueryWidth = screenSize.width - (padding * 2);
//
//     if (mediaQueryWidth >= cardMaxWidth) maxWidth = mediaQueryWidth;
//     else maxWidth = cardMaxWidth;
//
//     double headerHeight = isDesktop ? 80.0 : 120.0;
//
//     if (!widget.controller.expanded) headerHeight = .0;
//
//     return SliverPersistentHeader(
//       delegate: HeaderDelegateAddon(
//         expandedHeight: headerHeight + .1,
//         minHeight: headerHeight,
//         child: ExpandablePanel(
//           controller: widget.controller,
//           collapsed: const SizedBox(),
//           expanded: Container(
//             padding: EdgeInsets.symmetric( horizontal: padding ),
//             decoration: BoxDecoration( color: isDesktop ? const Color.fromRGBO(1, 114, 206, 1) : null ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(maxWidth: maxWidth),
//                     child: PercentStepper(
//                       steps: controller.items.map((step) => StepperStep(title: step)).toList(),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         )
//       ),
//     );
//
//   }
//
//
//   double getPadding(deviceScreenType) {
//     switch (deviceScreenType) {
//       case DeviceScreenType.desktop: return 111.0;
//       case DeviceScreenType.tablet: return 32.0;
//       default: return 16.0;
//     }
//   }
//
// }
