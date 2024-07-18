import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget{
  final String nome;

  const TelaHome({super.key, required this.nome});

  void logout(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-Vindo'),
        backgroundColor: Color.fromARGB(255, 213, 213, 213),
        actions: [
          IconButton(
            onPressed: () => logout(context), 
            icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.6),
            child: Text('Seja Bem-Vindo, \n $nome!',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(5, 5),
                  blurRadius: 15,
                ),
              ],
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Você está logado',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(204, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculadora'); // Navega para a tela calculadora
                  },
                  child: const Text('Ir para Calculadora'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
