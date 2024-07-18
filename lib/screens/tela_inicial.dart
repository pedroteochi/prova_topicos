import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  TelaInicialState createState() => TelaInicialState();
}


class TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prova Tópicos'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Prova Tópicos especiais em Informática: Pedro e Richard',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                child: const Text('Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}