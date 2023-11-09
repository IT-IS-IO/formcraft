
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:formcraft/src/components/interface.dart';


abstract class Manager {

  late final Component? root;

  final Map<String, dynamic> data = { };

  final FormBlocBuilder form = FormBlocBuilder();

  Future<Widget?> init(BuildContext context, Map<String, dynamic> data);

  void createComponent(Map<String, dynamic> data, {Component? parent});

  void renderWidgets(Component? component);

}

class FormBlocBuilder<T> extends FormBloc<T, T> {

  FormBlocBuilder() : super(isLoading: false);

  @override
  void onSubmitting() { }

}
