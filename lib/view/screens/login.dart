//import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_gamer/bloc/auth_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static FocusNode _focusNode = FocusNode();
  static final GlobalKey<FormState> formKey = GlobalKey();
  void dispose() {
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    String username = "";
    String password = "";
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
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0x5C757575),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Image.asset(
                        'assets/images/GatchIcon.png',
                        width: 200,
                        fit: BoxFit.fitWidth,
                        ),
                        const Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'GATCH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            /*ButtonsTabBar(
                              backgroundColor: Colors.white,
                              unselectedBackgroundColor: Colors.grey.withOpacity(0.5),
                              radius: 15,
                              contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              ),
                              tabs: const [
                                Tab(
                                  text: 'Entrar',
                                ),
                                Tab(
                                  text: 'Registrar',
                                ),
                              ],
                            ),*/
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                              child: TextFormField(
                                onSaved: (String? inValue) {
                                  username = inValue!;
                                },
                                validator: (String? inValue) {
                                  if (inValue!.isEmpty) {
                                    return "Insira um email";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                                  hintText: 'Insira seu email...',
                                  hintStyle: const TextStyle(fontSize: 25),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 20, 24),
                                ),
                                style: const TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F1113),
                                    ),
                                maxLines: 1,
                              )
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: TextFormField(
                                onSaved: (String? inValue) {
                                  password = inValue!;
                                },
                                validator: (String? inValue) {
                                  if (inValue!.length < 4) {
                                    return "Tem que ter ao menos 4 caracters";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
                                  hintText: 'Insira sua senha...',
                                  hintStyle: const TextStyle(fontSize: 25),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 20, 24),
                                ),
                                style: const TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F1113),
                                    ),
                                maxLines: 1,
                              )
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size?>(Size(230,40)),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      BlocProvider.of<AuthBloc>(context).add(LoginUser(username: username, password: password));
                                    }
                                  },
                                  child: const Text('Entrar')
                                ),

                                ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size?>(Size(230,40)),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      BlocProvider.of<AuthBloc>(context).add(RegisterUser(username: username, password: password));
                                    }
                                  },
                                  child: const Text('Registrar')
                                ),
                         
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  /*Widget usernameFormField() {
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
        /*if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          
        }*/
        Navigator.pushNamed(context, '/homePage');
      },
    );
  }*/
}
