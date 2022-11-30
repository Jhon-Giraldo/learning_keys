import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys in Flutter',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Hi Flutters'),
        ),
        body: const Center(
          child: Text('Learning Keys'),
        ),
      ),
    );
  }
}