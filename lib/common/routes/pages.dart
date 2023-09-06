import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/routes/names.dart';
import 'package:myteacher/pages/home/home_page.dart';
import 'package:myteacher/pages/register/bloc/register_bloc.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:myteacher/pages/welcome/bloc/welcone_blocs.dart';
import 'package:myteacher/pages/welcome/welcome.dart';

// unify bloc provider and routes with pages
class PageEntity {
  PageEntity({required this.name, required this.page, this.bloc});
  String name;
  Widget page;
  dynamic bloc;
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        name: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        name: AppRoutes.SIGNIN,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        name: AppRoutes.REGISTER,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        name: AppRoutes.HOME,
        page: const HomePage(),
      ),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }
}
