
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formcraft/src/addons/other/pager/core/controllers/navigator_controller.dart';
import 'package:formcraft/src/addons/other/pager/core/controllers/pager_controller.dart';
import 'package:provider/provider.dart';


class PagerNavigationDrawer extends StatelessWidget {

  const PagerNavigationDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final PagerController pagerController = Provider.of<PagerController>(context, listen: false);

    // DeviceScreenType deviceScreenType = getDeviceType(MediaQuery.of(context).size);
    //
    // bool isMobile = !(deviceScreenType == DeviceScreenType.tablet || deviceScreenType == DeviceScreenType.desktop);
    //
    // double containerHeight = isMobile ? 68.0 : 80.0;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 80),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 243, 243, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ChangeNotifierProvider<NavigatorController>.value(
        value: pagerController.navigator,
        child: Consumer<NavigatorController>(
            builder: (context, navigatorController, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Flexible(
                      child: TextButton(
                        onPressed: () async {

                          if (!navigatorController.canNavigatePrev) return;

                          await pagerController.changePage(next: false);

                        },
                        style: ButtonStyle(
                          minimumSize: const MaterialStatePropertyAll(Size(48, 48)),
                          maximumSize: const MaterialStatePropertyAll(Size(203, 48)),
                          overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
                          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                        ),
                        child: getPrevChild(context, navigatorController, false),
                      )
                  ),

                  const SizedBox(width: 10),

                  // if (!isMobile && pagerController.onSaveEvent != null) ...[
                  //
                  //   Expanded(
                  //     flex:  0,
                  //     child: TextButton(
                  //       onPressed: pagerController.onSave,
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
                  //         minimumSize: const MaterialStatePropertyAll(Size(203, 48)),
                  //         maximumSize: const MaterialStatePropertyAll(Size(203, 48)),
                  //         overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
                  //       ),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //
                  //           const Flexible(
                  //             child: FittedBox(
                  //               fit: BoxFit.fitWidth,
                  //               child: Text(
                  //                 'Save and exit',
                  //                 maxLines: 1,
                  //                 style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  //               ),
                  //             ),
                  //           ),
                  //
                  //
                  //           if (navigatorController.saveProcessing) ...[
                  //             const SizedBox(width: 12),
                  //             const SizedBox(
                  //               height: 16,
                  //               width: 16,
                  //               child: ColorFiltered(
                  //                 colorFilter: ColorFilter.mode(
                  //                   Colors.white,
                  //                   BlendMode.srcATop,
                  //                 ),
                  //                 child: CupertinoActivityIndicator(),
                  //               ),
                  //             )
                  //           ]
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //
                  //   SizedBox(width: 10),
                  // ],

                  Flexible(
                      child: TextButton(
                        onPressed: () async {

                          if (!navigatorController.canNavigateNext) {
                            // await pagerController.onEndNextEvent?.call();
                            return;
                          }

                          await pagerController.changePage(next: true);

                        },
                        style: ButtonStyle(
                          minimumSize: const MaterialStatePropertyAll(Size(48, 48)),
                          maximumSize: const MaterialStatePropertyAll(Size(203, 48)),
                          overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
                          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                        ),
                        child: getNextChild(context, navigatorController, false),
                      )
                  )

                ],
              );
            }
        ),
      ),
    );

  }


  Widget getPrevChild(context, NavigatorController controller, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isMobile
            ? const Flexible(child: Icon(Icons.arrow_back, color: Colors.white))
            : const Flexible(child: Text('Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
      ],
    );
  }

  Widget getNextChild(context, NavigatorController controller, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        if (isMobile && !controller.processing) ...[
          const Icon(Icons.arrow_forward, color: Colors.white),
        ],

        if (!isMobile) const Flexible(
          child: Text(
            'Forward',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        if (controller.processing) ...[

          if (!isMobile) const SizedBox(width: 8),

          const SizedBox(
            height: 24,
            width: 24,
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcATop,
                ),
                child: CupertinoActivityIndicator()
            ),
          ),

        ]


      ],
    );
  }


}

