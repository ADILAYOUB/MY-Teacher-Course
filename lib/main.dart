import 'package:flutter/material.dart';

import 'constants/strings_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } // persistant

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildFloatingActionButton(
                Icons.add, 'Increment', _incrementCounter),
            _buildFloatingActionButton(
                Icons.remove, 'Decrement', _decrementCounter),
            _buildFloatingActionButton(
                Icons.remove, 'Decrement', _decrementCounter),
            _buildFloatingActionButton(
                Icons.remove, 'Decrement', _decrementCounter),
          ],
        ));
  }

  Widget _buildFloatingActionButton(
      IconData icon, String tooltip, VoidCallback onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
