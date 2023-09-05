import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/values/colors.dart';
import 'package:myteacher/pages/bloc_providers.dart';
import 'package:myteacher/pages/home/home_page.dart';
import 'package:myteacher/pages/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'pages/register/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.allbocProvider,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'L-Teacher',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                color: AppColors.primaryText,
              )),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            routes: {
              '/signin': (context) => const SignIn(),
              'register': (context) => const Register(),
              'home': (context) => const HomePage(),
            },
          ),
        ));
  }
}
