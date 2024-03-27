import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_gamer/bloc/manage_db_bloc.dart';
import 'package:tinder_gamer/bloc/monitor_db_bloc.dart';
import 'package:tinder_gamer/bloc/auth_bloc.dart';
import 'package:tinder_gamer/view/screens/login.dart';

import 'lista.dart';
import 'perfil.dart';
import 'projeto.dart';

class PageState extends StatefulWidget {
  const PageState({Key? key}) : super(key: key);

  @override
  State<PageState> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageState>{
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          print('passou');
          return unauthenticatedWidget(context);
        }
      },
    );
  }

}

Widget authenticatedWidget(BuildContext context) {
  return const HomePage(title: "Home Page");
}

Widget unauthenticatedWidget(BuildContext context){
  return const Login();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  int _currentScreen = 2;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed:() => BlocProvider.of<AuthBloc>(context).add(Logout()),
              icon: const Icon(Icons.logout))
   
          ],
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 44, 32, 209),
          title: const Text('Gatch'),
        ),
        body: IndexedStack(
          index: _currentScreen,
          children: [
            PerfilPage(),
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
        )
      );
    //);
  }
}