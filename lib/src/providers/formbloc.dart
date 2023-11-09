

import 'package:flutter_form_bloc/flutter_form_bloc.dart';


class FormBlocProvider<T> extends FormBloc<T, T> {

  FormBlocProvider() : super(isLoading: false);

  @override
  void onSubmitting() { }

}