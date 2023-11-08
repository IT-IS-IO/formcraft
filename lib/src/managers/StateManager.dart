
import 'package:formcraft/src/components/components.dart';
import 'package:formcraft/src/components/interface.dart';
import 'package:formcraft/src/utils/logger_util.dart';
import 'package:formcraft/src/utils/string_util.dart';
import 'FormManager.dart';


abstract class Manager {

  final Map<String, dynamic> data = { };

  final FormBlocBuilder form = FormBlocBuilder();

  Component? root;

  Future<Widget?> init(BuildContext context, Map<String, dynamic> data);

  void createComponentTree(Map<String, dynamic> data, {Component? parent});

}


class StateManager extends Manager {

  @override
  Future<Widget?> init(BuildContext context, Map<String, dynamic> data) async {

    if (data.isEmpty) return null;

    createComponentTree(data, parent: null);

    // rebuild(root!);

    print(root?.child);

    root?.rebuild();

    return root?.widget;
  }


  @override
  void createComponentTree( Map<String, dynamic> data, {Component? parent }) {

    final String type = StringUtil.capitalize("${data['component']}Component");

    Logger.info("Component: $type");

    final Component? component = components[type];

    if (component != null) {

      if (parent != null) {
        parent.addChild(component);
      }
      else {
        root = component;
      }

      if (data.containsKey('children')) {
        for (final childData in List.of(data['children'])) {
          createComponentTree(childData, parent: component);
        }
      }
      else if (data.containsKey('child')) {
        createComponentTree(data['child'], parent: component);
      }


      super.data[component.uuid.toString()] = {
        "uuid": component.uuid,
        "type": component.type,
        "parent": parent?.uuid,
        "component": component,
      };

    }

  }


  void rebuild(Component? component) {

    if (component == null) return;

    if (component.child is List) {
      for (final child in component.child as List<Component>) {
        rebuild(child);
      }
    }
    else if (component.child is Component) {
      print(component.child);
      rebuild(component.child as Component);
    }
    else {
      component.rebuild();
    }

  }


}


