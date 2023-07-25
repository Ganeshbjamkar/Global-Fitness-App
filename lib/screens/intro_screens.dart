import 'package:flutter/material.dart';
import 'package:global_fitness/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global Fitness')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('/beach.jpg'), fit: BoxFit.cover)),
        child: Center(
            child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white70,
          ),
          child: const Text(
            'Commit to be fit, dare to be great \n with Global Fitness',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Colors.grey,
              )
            ]),
          ),
        )),
      ),
    );
  }
}


