import 'package:flutter/material.dart';
import 'package:prova_topicos/screens/tela_cadastro.dart';
import 'package:prova_topicos/screens/tela_home.dart';
import 'screens/tela_login.dart';
import 'screens/tela_home.dart';
import 'screens/tela_calculadora.dart';
import 'screens/tela_inicial.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
      routes: {
        '/home': (context) => TelaHome(nome: '', idade: 0,),
        '/calculadora': (context) => CalculatorScreen(),
        '/login': (context) => TelaLogin(),
        '/cadastro': (context) => TelaCadastro(),
      },
    );
  }
}
