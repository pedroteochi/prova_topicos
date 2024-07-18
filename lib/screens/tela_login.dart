import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Adicione esta linha
import 'package:prova_topicos/database/database.dart';
import 'package:prova_topicos/screens/tela_home.dart';
import 'package:prova_topicos/screens/tela_cadastro.dart'; // Importa a tela de cadastro

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseHelper = DatabaseHelper();

  void login() async {
    if (formKey.currentState!.validate()) {
      final user = await databaseHelper.getUser(emailController.text);

      if (user != null && user['password'] == passwordController.text) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaHome(email: emailController.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao inserir usuário!'),
          ),
        );
      }
    }
  }

  void LimpaTela() {
    emailController.clear();
    passwordController.clear();
  }

  void PrintAllUser() async {
    final users = await databaseHelper.getAllUsers();
    for (var user in users) {
      if (kDebugMode) {
        print('User: ${user['email']}, Password: ${user['password']}');
      }
    }
  }

  void navigateToCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaCadastro()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
        backgroundColor: Colors.blueGrey[100],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'E-Mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, digite o seu e-mail!';
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}')
                              .hasMatch(value)) {
                            return 'Digite um endereço de e-mail válido';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, digite sua senha';
                          } else if (value.length < 6) {
                            return 'A senha deve ter ao menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: navigateToCadastro, // Navega para a tela de cadastro
                          child: const Text('Cadastrar'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: login,
                          child: const Text('Login'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: LimpaTela,
                          child: const Text('Limpar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: PrintAllUser,
                child: const Text('Print All Users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
