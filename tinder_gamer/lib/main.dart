//Luis Francisco Ribeiro Malaquias 254289
//Gabriel Antunes Tosi 254221

// ignore_for_file: deprecated_colon_for_default_value, use_function_type_syntax_for_parameters, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'view/screens/login.dart';
import 'view/screens/homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Gatch');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[400],
      ),
      initialRoute: '/loginPage',
      routes: {
        '/loginPage':(context) => Login(),
        '/homePage':(context) => HomePage(),
      }
    );
  }
} 
