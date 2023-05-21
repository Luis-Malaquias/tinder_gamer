import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import '../../model/login_data.dart';
//import '../../model/perfil_data.dart';

final box = Hive.box('Gatch');


class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState()=> _Perfil();
}

class _Perfil extends State<Perfil>{
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String gender = '';
  bool adult = false;

  @override
  void initState() {
  super.initState();
  getMyBox();
  }

  Future<void> getMyBox() async {
    gender = await box.get('gender') ?? '';
    myController.text = await box.get('nome') ?? 'Insira o Nome';
    adult = await box.get('age') ?? false;
  }  

  //final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //final PerfilData perfilData = PerfilData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.blueGrey[200],
              ),
              width: 150.0,
              height: 150.0,
              child: const Icon(
                Icons.camera_alt,
                size: 100.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.all(20.0),
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              width: 300.0,
              child: Column(
                children: [
                  TextFormField(
                    controller: myController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                    ),
                    
                    onChanged: (String? value) {
                      box.put('nome', myController.text);
                    },
                  ),
                  const Divider(),
                  RadioListTile(
                    title: const Text('Homem'),
                    value: 'Homem',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Homem';
                      });
                      box.put('gender', value);
                    }
                  ),
                 
                  RadioListTile(
                    title: const Text('Mulher'),
                    value: 'Mulher',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Mulher';
                      });
                      box.put('gender', value);
                    }
                  ),
                 
                  RadioListTile(
                    title: const Text('Outro'),
                    value: 'Outro',
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = 'Outro';
                      });
                      box.put('gender', value);
                    }
                  ),

                  const Divider(),
                  Row(
                    children: [
                      Checkbox(
                        value: adult,
                         onChanged: (value){
                          setState(() {
                            adult = !adult;
                          });
                          box.put('age', value);
                        }
                      ),
                      const Text('+18')
                    ],
                  ),
                  ElevatedButton(
                    child: const Text("Salvar"),
                    onPressed:  () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Informações salvas!'),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  box.clear();
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
