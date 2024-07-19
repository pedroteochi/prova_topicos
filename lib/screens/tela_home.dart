import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget {
  final String nome;
  final int idade;
  final String sexo; // Adicione este parâmetro

  const TelaHome({
    Key? key,
    required this.nome,
    required this.idade,
    required this.sexo, // Adicione este parâmetro
  }) : super(key: key);

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Color _getBackgroundColor() {
    if (sexo == 'Feminino') {
      return idade < 30 ? Colors.pinkAccent : Colors.purple;
    } else if (sexo == 'Masculino') {
      return idade < 30 ? Colors.blueAccent : Colors.green;
    } else {
      return Colors.grey; // Cor padrão para 'Desconhecido'
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(), // Define a cor do fundo
      appBar: AppBar(
        title: const Text('Bem-Vindo'),
        backgroundColor: Color.fromARGB(255, 213, 213, 213),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.6),
            child: Text(
              'Seja Bem-Vindo, \n $nome $idade!',
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
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Você está logado',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(204, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculadora');
                  },
                  child: const Text('Ir para Calculadora'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/imc');
                  },
                  child: const Text('Ir para IMC'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
