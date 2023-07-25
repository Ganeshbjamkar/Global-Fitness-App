import 'package:flutter/material.dart';
import 'package:global_fitness/screens/bmi_screen.dart';
import 'package:global_fitness/screens/intro_screens.dart';

void main() {
  runApp(const GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen()
      },
      initialRoute: '/',
    );
  }
}
