import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/pages/register/bloc/register_bloc.dart';

import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcone_blocs.dart';

class AppBlocProviders {
  static get allbocProvider => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ];
}
