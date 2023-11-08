
import 'package:formcraft/src/components/interface.dart';
import 'FormManager.dart';


abstract class Manager {

  final Map<String, Component> data = { };

  final FormBlocBuilder form = FormBlocBuilder();

  final Widget tree = Container();

  Component get(String key) => data[key]!;

  Future<Widget?> init(BuildContext context, Map<String, dynamic> data);

  Component createComponent(Map<String, dynamic> data);

}


class StateManager extends Manager {



  @override
  Future<Widget?> init(BuildContext context, Map<String, dynamic> data) async {

    final rootComponent = createComponent(data);

    return rootComponent.widget;

  }



  @override
  Component createComponent(Map<String, dynamic> data) {

    final String type = data['type'] as String;

    return switch(type) {
      "grid" => createGrid(data),
      "text" => createText(data),
      _ => throw Exception("Unknown component type $type")
    };

    if (type == 'grid') {
      final grid = GridComponent();
      final children = data['children'] as List<dynamic>;
      for (final child in children) {
        final childComponent = createComponent(child);
        grid.addChild(childComponent);
      }
      return grid;
    } else if (type == 'text') {
      return TextComponent();
    }

    // Add handling for other component types as needed.

    throw Exception('Unsupported component type: $type');
  }


}


