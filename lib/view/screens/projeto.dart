import 'package:flutter/material.dart';

class Projeto extends StatelessWidget{
  const Projeto({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold( 
      body: Container(
        width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/GatchWallpaper.png',
                ).image,
              ),
              shape: BoxShape.rectangle,
            ),
        child: Container(
          decoration: BoxDecoration(color:  Color.fromARGB(153, 168, 168, 168)),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/iconeTinderGamer.png"),
                Padding(
                  padding: const EdgeInsets.all(50.0),
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
        ),
      ),
    );
  }
}