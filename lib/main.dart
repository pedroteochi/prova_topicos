import 'package:flutter/material.dart';
import 'screens/tela_login.dart';
import 'screens/tela_home.dart';
import 'screens/tela_calculadora.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TelaLogin(),
      routes: {
        '/home': (context) => TelaLogin(),
        '/calculadora': (context) => CalculatorScreen(),
      },
    );
  }
}
