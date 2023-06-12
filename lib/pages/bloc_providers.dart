import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/app_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(
      create: (context) => WelcomeBloc(),
      lazy: false,
    ),
    BlocProvider(
      create: (context) => AppBlocs(),
      lazy: false,
    ),
    BlocProvider(create: (context) => SignInBloc()),
  ];
}