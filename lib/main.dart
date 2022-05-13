//  GENERA CODIGO mateapp

import 'package:flutter/material.dart';

import 'screens/screens.dart'; //IMPORTAACION MASIVA

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//ELIMINAR BANNER DEBUG
      title: 'Notas App',
      initialRoute: 'login',//INICIAR CON LOIN
      routes: {
        'login':( _ ) => const LoginScreen(),//VISTA LOGIN
        'home':( _ ) => const HomeScreen(),//VISTA HOME
      },
      //CAMBIAR DE TEMA A GRIS EN GENERAL
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
    );
  }
}