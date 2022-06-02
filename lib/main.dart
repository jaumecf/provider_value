import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp(missatge: 'Uep provider!'));
}

// Anem a veure provider. Provider és una llibreria que va crear algú, però
// desde Google l'han acabat per incorporar a Flutter
/*
class MyApp extends StatelessWidget {
  final String missatge;
  const MyApp({Key? key, required this.missatge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text(missatge, style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
*/

// Simulam complexitat fent que els widgets pegin un de l'altre
// La idea és utilitzar un provider per a que proveexi al altres widgets
class MyApp extends StatelessWidget {
  final String missatge;
  const MyApp({Key? key, required this.missatge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: missatge,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Texte(),
    );
  }
}

class Texte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Aquest provider el que farà és anar pujant de contexte fins a trobar
    // un provider que contingui un String i el retornarà
    final missatge = Provider.of<String>(context);
    return Text(missatge, style: TextStyle(fontSize: 30));
  }
}
