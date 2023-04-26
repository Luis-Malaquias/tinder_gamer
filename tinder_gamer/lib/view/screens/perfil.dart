import 'package:flutter/material.dart';

import '../../model/login_data.dart';
import '../../model/perfil_data.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _Perfil createState()=> _Perfil();
}

class _Perfil extends State<Perfil>{
  

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PerfilData perfilData = PerfilData();

  String gender = "";
  bool adult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blueGrey[200],
              ),
              width: 150.0,
              height: 150.0,
              child: const Icon(
                Icons.person,
                size: 100.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.all(20.0),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              width: 300.0,
              height: 450.0,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                    ),
                    onSaved: (String? value) {
                    },
                  ),
                  Divider(),
                  RadioListTile(
                    title: Text('Homem'),
                    value: 'Homem',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Homem';
                      });
                    }
                  ),
                 
                  RadioListTile(
                    title: Text('Mulher'),
                    value: 'Mulher',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Mulher';
                      });
                    }
                  ),
                 
                  RadioListTile(
                    title: Text('Outro'),
                    value: 'Outro',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Outro';
                      });
                    }
                  ),

                  Divider(),
                  Row(
                    children: [
                      Checkbox(
                        value: adult,
                         onChanged: (value){
                          setState(() {
                            adult = !adult;
                          });
                        }
                      ),
                      Text('+18')
                    ],
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
