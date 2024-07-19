import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget {
  final String nome;
  final int idade;

  const TelaHome({super.key, required this.nome, required this.idade});

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Color CorFundoIdade() {
    if (idade < 10) {
      return const Color.fromARGB(255, 255, 125, 116);
    } else if (idade >= 10 && idade < 20) {
      return const Color.fromARGB(255, 249, 179, 74);
    } else if (idade >= 20 && idade < 30) {
      return const Color.fromARGB(255, 250, 238, 126);
    } else if (idade >= 30 && idade < 40) {
      return Colors.green;
    } else if (idade >= 40 && idade < 50) {
      return const Color.fromARGB(255, 91, 181, 255);
    }
    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CorFundoIdade(), // Define a cor do fundo
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.6),
            child: Text(
              'Bem-Vindo \n $nome!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculadora');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CorFundoIdade(),
                  ),
                  child: const Text(
                    'Calculadora',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/imc');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CorFundoIdade(),
                  ),
                  child: const Text('Calculadora IMC',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
