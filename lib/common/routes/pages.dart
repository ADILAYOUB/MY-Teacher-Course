import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/routes/names.dart';
import 'package:myteacher/pages/home/home_page.dart';
import 'package:myteacher/pages/register/bloc/register_bloc.dart';
import 'package:myteacher/pages/register/register.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:myteacher/pages/sign_in/sign_in.dart';
import 'package:myteacher/pages/welcome/bloc/welcone_blocs.dart';
import 'package:myteacher/pages/welcome/welcome.dart';

// unify bloc provider and routes with pages
class PageEntity {
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
  String route;
  Widget page;
  dynamic bloc;
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
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

  //a model that convers the entire screen as we click on the navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    // if (settings.route == AppRoutes.INITIAL) {
    //   return MaterialPageRoute(
    //     builder: (_) => const Welcome(),
    //   );
    // }

    if (settings.name != null) {
      // check for route name matching when navigator gets trigger
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print('valid route name ${settings.name}');
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    print('invalid route name  ${settings.name}');

    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}
