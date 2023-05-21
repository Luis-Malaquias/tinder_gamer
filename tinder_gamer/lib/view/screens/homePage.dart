import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'lista.dart';
import 'perfil.dart';
import 'projeto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{
  int _currentScreen = 2;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:() => Navigator.pop(context),
            icon: const Icon(Icons.logout))
          /*PopupMenuButton(
            itemBuilder: (BuildContext context){
              return[
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.logout),
                      Text('sair'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.sun),
                      Text('sair'),
                    ],
                  ),
                )
              ];
            }
          )*/
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[500],
        title: const Text('Gatch'),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children:  [
          Perfil(),
          Lista(),
          const Projeto(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( 
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pefil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
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