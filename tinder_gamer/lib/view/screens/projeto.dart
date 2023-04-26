import 'package:flutter/material.dart';

class Projeto extends StatelessWidget{
  const Projeto({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold( 
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/iconeTinderGamer.png"),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Esse é o tinder gamer\n\n",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), 
                    ),
                    TextSpan(text: "O intuito do tinder gamer é faciliar usuários a econtrar pessoas que gostam dos mesmos jogos para que possam jogar juntos.\n",
                    style: TextStyle(fontSize: 20),
                    ),
                    TextSpan(text: "Para isso o aplicativo pega as informações inseridas em seu perfil e busca outros perfis parecidos com o seu.",
                    style: TextStyle(fontSize: 20),
                    ),
                  ]
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
    ),
    );
  }
}