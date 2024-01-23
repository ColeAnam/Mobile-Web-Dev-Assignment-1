import 'package:flutter/material.dart';
import 'Calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pay Calculator'),
      ),
      body: Column(
        children: [
          Calculator(),
          SizedBox(height: 50),
          SizedBox(
            child: Text(
              'Cole Anam\n301009188',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              )
          ),
        ],
      ),
      ),
    );
  }
}
