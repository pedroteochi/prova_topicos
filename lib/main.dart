import 'package:flutter/material.dart';
import 'package:prova_topicos/screens/tela_cadastro.dart';
import 'package:prova_topicos/screens/tela_home.dart';
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
        '/calculadora': (context) => CalculatorScreen(),
        '/login': (context) => TelaLogin(),
        '/cadastro': (context) => TelaCadastro(),
        '/imc': (context) => TelaIMC(), // Adicione a rota da tela do IMC
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => TelaHome(
              nome: args['nome'] ?? '',
              idade: args['idade'] ?? 0,
              sexo: args['sexo'] ?? 'Desconhecido', // Valor padrão
            ),
          );
        }
        return null;
      },
    );
  }
}
