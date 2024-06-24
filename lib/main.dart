import 'package:chat_interaction/disclosure_interaction/disclosure_interaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home1(),
    );
  }
}

class Home1 extends StatelessWidget {
  const Home1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DiscInteract(
          children: List.generate(
            7,
            (index) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
