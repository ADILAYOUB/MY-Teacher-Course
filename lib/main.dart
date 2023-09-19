import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/common/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myteacher/pages/welcome/welcome.dart';

import 'firebase_options.dart';

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
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'L-Teacher',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const Welcome(),
            onGenerateRoute: AppPages.generateRouteSettings,
          ),
        ));
  }
}
