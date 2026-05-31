import 'package:flutter/material.dart';
import 'controllers/emission_controller.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EmissionController();
    controller.loadEmissions();

    return MaterialApp(
      title: 'Streaming App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: HomePage(controller: controller),
    );
  }
}