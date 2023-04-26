import 'package:flutter/material.dart';
import 'package:tinder_gamer/view/screens/lista.dart';
import 'package:tinder_gamer/view/screens/perfil.dart';
import 'package:tinder_gamer/view/screens/projeto.dart';

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
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[800],
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Tinder Gamer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: const [
          Projeto(),
          Perfil(),
          Lista(),
        ],
      )
    );
  }
}
