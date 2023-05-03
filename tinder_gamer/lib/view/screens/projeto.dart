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
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: const [
                  Text("Esse é o Gatch\n",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                    ),
                  Text("O Gatch nasceu com o intuito de conectar gamers por todo o mundo. Unir players dos mesmos jogos e com os mesmos interesses é nossa missão para construir uma comunidade mais unida e interpessoal. Nossa plataforma pega as informações dos nossos usuários e busca pessoas com interesses e perfis semelhantes para construir novas conexões.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify
                    ),
                ],
              ),
            ),
          ],
        ),
    ),
    );
  }
}