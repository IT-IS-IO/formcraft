
part of component_interface;


mixin Conditional on ChangeNotifier {

  ListenOperator listener = ListenOperatorBuilder();

  final _jsonLogic = Jsonlogic();

  bool _visible = true;

  bool _listenable = false;

  bool get listenable => _listenable;

  bool get isVisible => _visible;

  // bool get conditional => _condition != null;


  set visible(bool value) {
    _visible = value;
    notifyListeners();
  }


  final List<Map<String, dynamic>> _listenables = [];


  List<ListenOperator> get listenables {

    List<ListenOperator> listenableComponents = [];

    for (var element in _listenables) {
        listenableComponents.add(element["component"].listener);
    }

    return listenableComponents;
  }


  void _buildCondition(Map<String, dynamic> condition) {

    _parse(condition);

    listener
      ..subscribeToFieldBlocs(listenables)
      ..updateValidators([_trigger]);

  }


  void _parse(Map<String, dynamic> condition) {

    if (condition.containsKey("logic")) {
      _parseSimpleLogic(condition["logic"]);
    }

    if (condition.containsKey("conditional")) {
      _parseJsonLogic(condition["conditional"]);
    }

  }





  void _trigger(value) {

    // visible = _simpleTrigger();

    visible = _jsonTrigger();

  }


  void _parseSimpleLogic(conditions) {
    for (var element in conditions) {

      if (element.containsKey("trigger")) {
        if (element["trigger"]["type"] == "simple") {
          if (element["trigger"]["simple"]["show"] == true) {

            String key = element["trigger"]["simple"]["when"];

            Component? component = StorageProvider.instance.getComponent(key);

            if (component != null) {
              _listenables.add({
                "key": key,
                "component": component,
                "eq": element["trigger"]["simple"]["eq"],
              });
            }

          }
        }
      }

    }
  }


  void _parseJsonLogic(conditions) {

    var res = _jsonLogic.apply(
        conditions['json'],
        {
          "typeMe": listener.value
        }
    );

    print(conditions['json']);
    print(res);

  }


  bool _simpleTrigger() {

    List<bool> results = [];

    for (Map<String, dynamic> field in _listenables) {

      if (field["component"].value == field["eq"]) {
        results.add(true);
      }

    }

    if (results.isEmpty) return false;

    return results.every((element) => element == true);

  }


  bool _jsonTrigger() {
    return false;
  }




  Widget _wrapWithListenable(Widget widget) {

    // if (!conditional) return widget;

    _listenable = true;

    return ListenableBuilder(
      listenable: this,
      builder: (context, child) {
        if (!isVisible) return const SizedBox();
        return widget;
      },
    );

  }


}
