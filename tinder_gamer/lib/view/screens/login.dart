import 'package:flutter/material.dart';
import 'package:tinder_gamer/main.dart';

import '../../model/login_data.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData(username: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(        
          padding: const EdgeInsets.all(10.0),
          color: Colors.blue[200],
          width: 300.0,
          height: 270.0,  
          child: Form(
            key: formKey,
            child: Column(
              children: [
                usernameFormField(),
                passwordFormField(),
                const Divider(),
                submitButton(),
              ],
            ),
          ),
          )
      )
    );
  }

  Widget usernameFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.isEmpty) {
              return "Insira um nome de usuário";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.username = inValue ?? "";
        },
        decoration: const InputDecoration(
          hintText: "user@domain.br",
          labelText: "Username (E-mail Address)",
        ),
      );
  }

  Widget passwordFormField() {
    return TextFormField(
        obscureText: true,
        validator: (String? inValue) {
          if (inValue != null) {
            if (inValue.length < 10) {
              return "Mínimo de 10 letras";
            }
          }
          return null;
        },
        onSaved: (String? inValue) {
          loginData.password = inValue ?? "";
        },
        decoration: const InputDecoration(
          labelText: "Insira uma senha forte",
        ),
    );
  }

  Widget submitButton() {
    return  ElevatedButton(
      child: const Text("Log In!"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      },
    );
  }
}
