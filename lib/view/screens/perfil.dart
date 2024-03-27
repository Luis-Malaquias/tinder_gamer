import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../../provider/firestore_firebase.dart';
import '../../model/user_model.dart';

final box = Hive.box('Gatch');


class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState()=> _PerfilPage();
}

class _PerfilPage extends State<PerfilPage>{
  final FocusNode _focusNode = FocusNode();
  final nameController = TextEditingController();
  final gameController = TextEditingController();
  final ageController = TextEditingController();
  final platformController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  String id = FirestoreDatabase.helper.uid!;
  bool adult = false;
  String? dropdownValue = 'Homem';
  UserModel user = UserModel(name: '', gender: '', game: '', age: '', platform: '');
  File? _image;
  String path = "";
 
  @override
  void dispose() {
    _focusNode.dispose();
    nameController.dispose();
    gameController.dispose();
    ageController.dispose();
    platformController.dispose();
    super.dispose();
  }

  @override
  void initState() {
  super.initState();
  
  getUserData();
 // getMyBox();
  }

  /*Future<void> getMyBox() async {
    gender = await box.get('gender') ?? '';
    nameController.text = await box.get('nome') ?? 'Insira o Nome';
    gameController.text = await box.get('jogo') ?? 'Insira o Jogo';
    adult = await box.get('age') ?? false;
  }  */

  Future<void> getUserData() async{  
    UserModel userData = await FirestoreDatabase.helper.getUser() as UserModel;
    user = userData;
    nameController.text = userData.name;
    gameController.text = userData.game;
    ageController.text = userData.age;
    platformController.text = userData.platform;
    if(userData.path != ''){
      path = userData.path;
    }
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () => FocusScope.of(context).requestFocus(_focusNode),
    child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Builder(
                builder: (BuildContext context) {
                  if (_image != null) {
                    return Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        
                      ),
                    );
                  } 
                  if(path!=""){          
                      return CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(path),
                      );
                  }
                  else {
                    return const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Icon(Icons.person, size: 160),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          XFile? image =
                              await picker.pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              path = image.path;
                              _image = File(path);
                            });
                          }
                        },
                        icon: const Icon(Icons.folder)),
                    ),
                    Card(
                      color: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          XFile? image = await picker.pickImage(source: ImageSource.camera);
                          if (image != null) {
                            setState(() {
                              path = image.path;
                              _image = File(path);
                            });
                          }
                        },
                        icon: const Icon(Icons.camera)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 60),
                child: Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  width: 300.0,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        nameFormField(),
                        const Divider(),
                        genderFormField(),
                        const Divider(),
                        ageFormField(),
                        const Divider(),
                        gamesList(),
                        const Divider(),
                        platformField(),
                        submitButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget nameFormField(){
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Nickname',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Adicione um nome";
        }
        return null;
      },
      onSaved:  (value) {},
      onChanged: (value) {
        box.put('nome', value);
      },
    );
  }
  
  Widget genderFormField(){
    return DropdownButtonFormField(
      value: dropdownValue,
      onChanged: (Value) {
        setState(() {
        dropdownValue = Value;
        });
    },
  items: <String>['Homem', 'Mulher', 'Outro']
    .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    })
    .toList(),
);
       
  }

  Widget ageFormField(){
    return TextFormField(
      controller: ageController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Idade',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Insira sua Idade";
        }
        return null;
      },
      onSaved:  (value) {},
      onChanged: (value) {
        box.put('jogo', value);
      },
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      child: const Text("Salvar"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          user.name = nameController.text;
          user.game = gameController.text;
          user.age = ageController.text;
          user.gender = dropdownValue!;
          user.platform = platformController.text;
          user.path = path;
          FirestoreDatabase.helper.updateUser(user);
          /*String name = await box.get('nome');
          String game = await box.get('jogo');
          gender = await box.get('gender');
          adult = await box.get('age');*/
        }
      }
    );
  }

  Widget gamesList() {
    return TextFormField(
      controller: gameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Jogo',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Qual jogo quer jogar?";
        }
        return null;
      },
      onSaved:  (value) {},
      onChanged: (value) {
        box.put('jogo', value);
      },
    );
  }

  Widget platformField() {
    return TextFormField(
      controller: platformController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Plataforma',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Insira a plataforma";
        }
        return null;
      },
      onSaved:  (value) {},
    );
  }



}
