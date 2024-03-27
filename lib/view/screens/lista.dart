import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tinder_gamer/model/user_model.dart';
import 'package:tinder_gamer/provider/firestore_firebase.dart';

class Lista extends StatelessWidget {
  Lista({super.key});
  String uid = FirestoreDatabase.helper.uid!;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection("Users")
          .where(FieldPath.documentId, isNotEqualTo: uid)/*.where("Game", isEqualTo: user.game)*/
          .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasError) {
            return Text('Ocorreu um erro');
            }
      
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Carregando...');
            }
      
            if (snapshot.hasData) {
              final users = snapshot.data!.docs; // Lista de documentos
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index].data() as Map<String, dynamic>;
      
                  // Aqui você pode usar os dados do usuário como desejar
                  final name = user['Name'];
                  final gender = user['Gender'];
                  final game = user['Game'];
                  final age = user['Age'];
                  final platform = user['Platform'];
      
                  return Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: 8,
                          ),
                          const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 30,
                              child: Icon(Icons.person, size: 30,)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                child: Card(
                                  color: Colors.grey[400],
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text('Nome: $name',
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                child: Card(    
                                  color: Colors.grey[400],
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text('Jogo: $game',
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                child: Card(
                                  
                                  color: Colors.grey[400],
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text('Idade: $age',
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Card(
                                  
                                  color: Colors.grey[400],
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text('genero: $gender',
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                child: Card(    
                                  color: Colors.grey[400],
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Text('Plataforma: $platform',
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                    ),
                                  )
                                )
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                },
              );
            }
      
            return Text('Nenhum usuário encontrado.');
          }
        ),
      ),
    );
  }
}