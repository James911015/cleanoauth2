import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const String name = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla Principal"),),
      body: const Center(
        child: Text("Bienvenido a la pantalla principal"),
      ),
    );
  }
}
