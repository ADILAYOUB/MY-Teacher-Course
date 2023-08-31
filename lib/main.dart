import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/app_bloc.dart';
import 'package:myteacher/app_event.dart';
import 'package:myteacher/pages/sign_in/sign_in.dart';
import 'package:myteacher/pages/welcome/bloc/welcone_blocs.dart';
import 'package:myteacher/pages/welcome/welcome.dart';

import 'app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (context) => AppBloc(),
          )
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'L-Techer',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const Welcome(),
            routes: {
              '/home': (context) => const MyHomePage(),
              '/signin': (context) => const SignIn(),
            },
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Techer Video Course'),
        ),
        body: Center(
          child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${BlocProvider.of<AppBloc>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildFloatingActionButton(
                Icons.add,
                'Increment',
                () =>
                    BlocProvider.of<AppBloc>(context).add(IncrementCounter())),
            _buildFloatingActionButton(
                Icons.remove,
                'Decrement',
                () =>
                    BlocProvider.of<AppBloc>(context).add(DecrementCounter())),
          ],
        ));
  }

  Widget _buildFloatingActionButton(
      IconData icon, String tooltip, VoidCallback onPressed) {
    return FloatingActionButton(
      heroTag: tooltip,
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
