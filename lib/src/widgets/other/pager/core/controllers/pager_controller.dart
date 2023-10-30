import 'package:flutter/material.dart';
import 'package:formcraft/src/utils/typedefs/fc_typedefs.dart';
import 'package:formcraft/src/widgets/other/pager/core/controllers/navigator_controller.dart';
import 'package:formcraft/src/widgets/other/pager/core/controllers/panel_controller.dart';
import 'package:formcraft/src/widgets/other/pager/core/utils/pager_utils.dart';


class PagerController extends ChangeNotifier {


  final NavigatorController navigator = NavigatorController();
  final PanelController panelController = PanelController();
  final PageController pageController = PageController(initialPage: 0, keepPage: true);
  final Map<int, PageController> _nestedPageControllers = { };

  ChangedEvent? onChanged;
  VoidCallback? onStart;
  VoidCallback? onEnd;
  ServerSideEvent<void>? onEndNextEvent;
  ServerSideEvent<bool>? serverSideEvent;
  ServerSideEvent<void>? onSaveEvent;


  Map<int, PageController> get nestedPageControllers => _nestedPageControllers;

  int get currentPage => PagerUtils.getCurrentPage( pageController );

  int get currentChildPage => PagerUtils.getCurrentPage( _getOrPutNestedPageController(currentPage) );

  int get pageCount => PagerUtils.calculatePageCount( pageController );

  int get childPageCount => PagerUtils.calculatePageCount( _getOrPutNestedPageController( currentPage ) );


  bool _isChangingPage = false;


  Future<void> changePage({ bool next = true, manual = false }) async {

    if (_isChangingPage || _nestedPageControllers.isEmpty) return;

    _isChangingPage = true;

    final PageController controller = _getOrPutNestedPageController( currentPage );

    if (serverSideEvent != null && next && !manual && !await _onPageNextServerSide()) {
        _isChangingPage = false;
        return;
    }


    if ( (PagerUtils.isMinExtent(controller) && !next) || (PagerUtils.isMaxExtent(controller) && next) ) {
      await PagerUtils.changePage(pageController, next);
    }
    else {
      if (!PagerUtils.canForward(controller, next)) return;
      await PagerUtils.changePage(controller, next);
    }

    _onPageChanged( currentPage );

    if ( currentChildPage == childPageCount && PagerUtils.isMaxExtent(pageController) ) {
      _onPageEnd();
    }
    else if ( currentChildPage == 0 && PagerUtils.isMinExtent(pageController) ) {
      _onPageStart();
    }

    Future.delayed( const Duration(milliseconds: 300), () => _isChangingPage = false );

  }


  PageController getChildPageController( int index ) => _getOrPutNestedPageController(index);


  PageController _getOrPutNestedPageController( int pageIndex ) {
    return _nestedPageControllers.putIfAbsent(pageIndex, () => PageController(keepPage: true, initialPage: 0));
  }


  void _onPageChanged( int index ) {
    navigator.onChanged();
    panelController.onChangedPager(index, childPageCount, currentChildPage);
    onChanged?.call(index);
    notifyListeners();
  }


  void _onPageStart() {
    // Logger.info("Page start triggered");
    navigator.onStart();
    onStart?.call();
  }


  void _onPageEnd() {
    // Logger.info("Page end triggered");
    navigator.onEnd();
    onEnd?.call();
  }


  Future<bool> _onPageNextServerSide() async {

    navigator.processing = true;

    try {
      bool result = await serverSideEvent?.call() ?? true;

      navigator.processing = false;
      return result;
    }
    catch (e) {
      navigator.processing = false;
    }

    return false;

  }


  Future<bool> onSave() async {

    navigator.saveProcessing = true;
    navigator.disable();

    await Future.delayed(const Duration(milliseconds: 300));

    try {
      await onSaveEvent?.call();
      navigator.saveProcessing = false;
    }
    catch (e) {
      navigator.saveProcessing = false;
      navigator.reset();
      // Logger.error(e, stackTrace: StackTrace.current);
      return false;
    }

    navigator.reset();
    return true;

  }


  @override
  void dispose() {
    pageController.dispose();
    for (PageController controller in _nestedPageControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

}