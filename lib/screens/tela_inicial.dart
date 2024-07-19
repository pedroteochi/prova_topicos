import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  TelaInicialState createState() => TelaInicialState();
}


class TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Prova Tópicos', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Prova Tópicos Especiais em Informática: Pedro e Richard',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                
              ),
              const SizedBox(height: 200),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  
                ),
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Login', style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                child: const Text('Cadastro',style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}