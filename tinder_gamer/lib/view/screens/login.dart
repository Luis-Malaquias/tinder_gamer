import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../../model/login_data.dart';

class Login extends StatefulWidget {
  const Login({super.key,});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{  
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
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
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0, 0),
                            child:  ButtonsTabBar(
                              labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
                              unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 15),
                              backgroundColor: Colors.white,
                              unselectedBackgroundColor: Colors.black.withOpacity(0.1),
                              borderWidth: 0,
                              radius: 20,
                              elevation: 1,
                              contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                              tabs: const [
                                Tab(
                                  text: 'Entrar',
                                ),
                                Tab(
                                  text: 'Criar',
                                )
                              ],
                            )
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(fontSize: 20),
                                      hintText: 'Insira seu email...',
                                      hintStyle: TextStyle(fontSize: 25),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      /*errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),*/
                                      /*focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),*/
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                    ),
                                    style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0F1113),
                                        ),
                                    maxLines: 1,
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Senha',
                                      labelStyle: TextStyle(fontSize: 20),
                                      hintText: 'Insira sua senha...',
                                      hintStyle: TextStyle(fontSize: 25),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      /*errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),*/
                                      /*focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),*/
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 20, 24),
                                    ),
                                    style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF0F1113),
                                        ),
                                    maxLines: 1,
                                  )
                                ),
                              ],
                            )
                          )
                        ]
                      )
                    )
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
