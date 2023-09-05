import 'package:flutter/material.dart';
import 'package:myteacher/pages/home/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPagesFromNav(0),
      )),
    );
  }
}
