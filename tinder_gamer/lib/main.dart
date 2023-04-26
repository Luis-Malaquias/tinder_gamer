import 'package:flutter/material.dart';
import 'package:tinder_gamer/view/screens/lista.dart';
import 'package:tinder_gamer/view/screens/login.dart';
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
      title: 'Gatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[400],
      ),
      home: const MyHomePage(title: 'Gatch'),
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
  int _currentScreen = 2;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children:  [
          Perfil(),
          Lista(),
          Projeto(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( 
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pefil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Jogadores'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info'
          ),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
      ),
    );
  }
}
