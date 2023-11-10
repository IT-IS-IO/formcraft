
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/components/components.dart';
import 'package:formcraft/src/components/field_interface.dart';
import 'package:formcraft/src/components/interface.dart';
import 'interface.dart';


class StateManager extends Manager {


  @override
  Future<Widget?> init(BuildContext context, Map<String, dynamic> data) async {

    if (data.isEmpty) return null;

    createComponent(data, parent: null);

    renderWidgets(root!);

    storage.set("context", context);

    return root?.widget;
  }



  @override
  void createComponent( Map<String, dynamic> data, {Component? parent }) {

    final Component? component = ComponentFactory.create(data);

    if (component != null) {

      if (parent != null) {
        parent.addChild(component);
      }
      else {
        root = component;
      }

      if (data.containsKey('children')) {
        for (final childData in List.of(data['children'])) {
          createComponent(childData, parent: component);
        }
      }
      else if (data.containsKey('child')) {
        createComponent(data['child'], parent: component);
      }

      storage.set(component.uuid.toString(), {
        "uuid": component.uuid,
        "type": component.type,
        "parent": parent?.uuid,
        "component": component,
      });

    }

  }



  @override
  void renderWidgets(Component? component) {

    if (component == null) return;

    if (component.child is List) {
      for (final child in component.child as List<Component>) {
        renderWidgets(child);
      }
    }
    else if (component.child is Component) {
      renderWidgets(component.child as Component);
    }

    component.render();

    if (component is FieldComponent) {

      if (component.fieldBloc == null) {
        print(component);
        throw Exception("FieldComponent: FieldBloc is null");
      }

      form.addFieldBloc(fieldBloc: component.fieldBloc as FieldBloc);

    }

  }



  void hide() {

    Component? component = (root?.child as List<Component>).first;

    component.toggleHide();

    renderWidgets(component);
  }


}
