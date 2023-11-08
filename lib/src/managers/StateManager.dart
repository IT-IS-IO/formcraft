
import 'package:formcraft/src/components/components.dart';
import 'package:formcraft/src/components/interface.dart';
import 'package:formcraft/src/utils/logger_util.dart';
import 'package:formcraft/src/utils/string_util.dart';
import 'FormManager.dart';


abstract class Manager {

  final Map<String, Component> data = { };

  final FormBlocBuilder form = FormBlocBuilder();

  Component? root;

  Component get(String key) => data[key]!;

  Future<Widget?> init(BuildContext context, Map<String, dynamic> data);

  Component? createComponent(Map<String, dynamic> data);

  void createComponentTree(Map<String, dynamic> data);


}


class StateManager extends Manager {


  @override
  Future<Widget?> init(BuildContext context, Map<String, dynamic> data) async {

    if (data.isEmpty) return null;

    await createComponentTree(data);

    Logger.info("Root: ${root?.widget}");

    return root?.widget;

  }




  @override
  Component? createComponent(Map<String, dynamic> data) {

    final String type = StringUtil.capitalize("${data['component']}Component");

    return components[type]?..render(data: data);

  }



  @override
  Future<void> createComponentTree(Map<String, dynamic> data, { Component? parent }) async {

    final String type = StringUtil.capitalize("${data['component']}Component");

    Logger.info("Component: $type");

    final Component? component = components[type];

    if (component != null) {

      if (root == null) {

        root = component;

        if (data['children'] != null) {
          for (final childData in List.of(data['children'])) {
            createComponentTree(childData, parent: root);
          }
        }
        else if (data['child'] != null) {
          createComponentTree(data['child'], parent: root);
        }

      }
      else {

        if (parent != null) parent.addChild(component);
        else Logger.error("Parent is null.");

        if (data['children'] != null) {
          final List<dynamic> childrenData = data['children'];
          for (final childData in childrenData) {
            createComponentTree(childData, parent: component);
          }
        }
        else if (data['child'] != null) {
          createComponentTree(data['child'], parent: component);
        }

      }
    }


  }






}


