import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/routes/names.dart';
import 'package:myteacher/global.dart';
import 'package:myteacher/pages/app/app_page.dart';
import 'package:myteacher/pages/app/bloc/app_blocs.dart';
import 'package:myteacher/pages/home/bloc/home_page_bloc.dart';
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
        route: AppRoutes.APP,
        page: const AppPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBlocs()),
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
      //check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
              builder: (_) => const AppPage(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    // 404 Page not found
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
