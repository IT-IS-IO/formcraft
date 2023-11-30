
import 'package:formcraft/src/components/interfaces/component_interface.dart';
import 'package:formcraft/src/providers/storage.dart';

import '../../providers/formbloc.dart';


abstract class Manager {

  late final Component? root;

  final StorageProvider storage = StorageProvider.instance;

  final FormBlocProvider form = FormBlocProvider();

  Future<Widget?> init(BuildContext context, Map<String, dynamic> data);

  void createComponent(Map<String, dynamic> data, {Component? parent});

  void renderWidgets(Component? component);

}


