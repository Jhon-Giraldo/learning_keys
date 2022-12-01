import 'dart:js_util';

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keys in Flutter',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  
  late List<Widget> boxes;

  @override
  void initState() {
    super.initState();
    boxes = [
      //StatelessColorBox(randomColorBoxes: randomColor()),
      //StatelessColorBox(randomColorBoxes: randomColor()),
    const StatefulColorBox(key: ValueKey('Colorful1')),
    const StatefulColorBox(key: ValueKey('Colorful2')),
  ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Learning Keys'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: boxes),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeBoxesColor,
        child: const Icon(Icons.replay_outlined)),
    );
  }

  changeBoxesColor() {
    setState(() {
      boxes.insert(1, boxes.removeAt(0));
    });
  }
}


// StalessWidgetExample
class StatelessColorBox extends StatelessWidget {
  const StatelessColorBox({super.key, required this.randomColorBoxes});

  final Color randomColorBoxes;

  @override
  Widget build(BuildContext context) {

    //final randomColorBoxes = randomColor();

    return Container(
      color: randomColorBoxes,
      child: const Padding(padding: EdgeInsets.all(85.0)),
    );
  }

}

// StatefulWidgetExample
class StatefulColorBox extends StatefulWidget {
  const StatefulColorBox({super.key});


  @override
  State<StatefulColorBox> createState() => _StatefulColorBoxState();
}

class _StatefulColorBoxState extends State<StatefulColorBox> {

  late Color randomColorBoxes;

  @override
  void initState() {
    super.initState();
    randomColorBoxes = randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: randomColorBoxes,
      child: const Padding(padding: EdgeInsets.all(85.0)),
    );
  }

}


//RandomColor
randomColor(){
  Random randomColor = Random();
  return Color.fromRGBO(
    randomColor.nextInt(255), 
    randomColor.nextInt(255), 
    randomColor.nextInt(255), 
    1,
  );
}
