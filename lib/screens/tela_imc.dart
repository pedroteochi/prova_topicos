import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  double? imc;
  String? mensagem;
  Color? corBolinha;

  void verificaImc() {
    if (pesoController.text.isEmpty || alturaController.text.isEmpty) {
      return; 
    }

    final double peso = double.parse(pesoController.text);
    final double altura = double.parse(alturaController.text);

    setState(() {
      imc = peso / (altura * altura);

      if (imc! < 18) {
        mensagem = 'Magreza';
        corBolinha = Colors.green;
      } else if (imc! >= 18 && imc! < 24.9) {
        mensagem = 'Normal';
        corBolinha = Colors.green; 
      } else if (imc! >= 25 && imc! < 29.9) {
        mensagem = 'Sobrepeso';
        corBolinha = Colors.yellow; 
      } else if (imc! >= 30 && imc! < 34.9) {
        mensagem = 'Obesidade Grau I';
        corBolinha = Colors.orange; 
      } else if (imc! >= 35 && imc! < 39.9) {
        mensagem = 'Obesidade Grau II';
        corBolinha = Colors.red; 
      } else {
        mensagem = 'Obesidade Grau III';
        corBolinha = Colors.red; 
      }
    });
  }

  void limparCampos() {
    setState(() {
      pesoController.clear(); 
      alturaController.clear(); 
      imc = null; 
      mensagem = null; 
      corBolinha = null; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC',
        style: TextStyle(fontSize: 20)
        ), 
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,1}')
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu peso (kg)',
                hintText: 'Exemplo: 85.0kg',
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}')
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua altura (m)',
                hintText: 'Exemplo: 1.75m',
              ),
            ),
            SizedBox(height: 20),
            Row(children: [
               ElevatedButton(
              onPressed: verificaImc, 
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: limparCampos, 
              child: Text('Limpar'),
              style: ElevatedButton.styleFrom(
              ),
            ),
            ],),
            SizedBox(height: 20),
            if (imc != null && mensagem != null)
              Column(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text(
                    'IMC: ${imc!.toStringAsFixed(2)}\nEstado de ${mensagem}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: corBolinha ?? Colors.transparent,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
