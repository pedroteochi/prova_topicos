import 'package:flutter/material.dart';
import 'package:prova_topicos/screens/tela_cadastro.dart';
import 'package:prova_topicos/screens/tela_login.dart';
import 'package:prova_topicos/screens/tela_calculadora.dart';
import 'package:prova_topicos/screens/tela_inicial.dart';
import 'package:prova_topicos/screens/tela_imc.dart'; // Importe a tela do IMC

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(),
      routes: {
        '/calculadora': (context) => const Calculadora(corBase: Colors.white,),
        '/login': (context) => const TelaLogin(),
        '/cadastro': (context) => const TelaCadastro(),
        '/imc': (context) => const TelaIMC(corBase: Colors.white,), 
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/home') {
      //     final args = settings.arguments as Map<String, dynamic>;
      //     return MaterialPageRoute(
      //       builder: (context) => TelaHome(nome: args['nome'] ?? '', idade: args['idade'] ?? 0,),
      //     );
      //   }
      //   return null;
      // },
    );
  }
}
