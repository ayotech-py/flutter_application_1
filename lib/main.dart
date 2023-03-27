import 'package:flutter/material.dart';
import 'package:flutter_application_1/random_selector.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Random Number Generator',
      home: const RandomSelectorPage(),
    );
  }
}
