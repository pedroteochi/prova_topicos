import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  final Color corBase;

  const Calculadora({required this.corBase});

  @override
  CalculadoraScreen createState() => CalculadoraScreen();
}


class CalculadoraScreen extends State<Calculadora> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String resultado = '';

  void Calcular(String operation) {
    setState(() {
      final num1 = double.tryParse(_controller1.text);
      final num2 = double.tryParse(_controller2.text);

      if (num1 == null || num2 == null) {
        resultado = 'Insira números válidos';
        return;
      }

      switch (operation) {
        case 'C':
          _controller1.clear();
          _controller2.clear();
          resultado = '';
          break;
        case '+':
          resultado = (num1 + num2).toString();
          break;
        case '-':
          resultado = (num1 - num2).toString();
          break;
        case '*':
          resultado = (num1 * num2).toString();
          break;
        case '/':
          if (num2 == 0) {
            resultado = 'Não é possivel dividir por zero';
          } else {
            resultado = (num1 / num2).toString();
          }
          break;
        default:
          resultado = 'Operação inválida';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
        backgroundColor: widget.corBase,
        title: const Text('Calculadora', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'Primeiro Número',
                border: OutlineInputBorder(),
                ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _controller2,
              decoration: const InputDecoration(labelText: 'Segundo Número',  
              border: OutlineInputBorder(),
              ),
              
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 60,
                child: ElevatedButton(
                  onPressed: () => Calcular('+'),
                  style: ElevatedButton.styleFrom(backgroundColor: widget.corBase),
                  child: const Text('+',style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                ),
                SizedBox(
                  width: 60,
                child: ElevatedButton(
                  onPressed: () => Calcular('-'),
                  style: ElevatedButton.styleFrom(backgroundColor: widget.corBase),
                  child: const Text('-',style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                ),
                
                SizedBox(
                  width: 60,
                child:ElevatedButton(
                  onPressed: () => Calcular('*'),
                  style: ElevatedButton.styleFrom(backgroundColor: widget.corBase),
                  child: const Text('*',
                      style: TextStyle(color: Colors.white,fontSize: 22),),
                  ),
                ),

                SizedBox(
                  width: 60,
                child: ElevatedButton(
                  onPressed: () => Calcular('/'),
                  style: ElevatedButton.styleFrom(backgroundColor: widget.corBase),
                  child: const Text('/', style: TextStyle(color: Colors.white, fontSize: 22),),
                  ),
                ),

                SizedBox(
                  width: 60,
                child: ElevatedButton(
                  onPressed: () => Calcular('C'),
                  style: ElevatedButton.styleFrom(backgroundColor: widget.corBase),
                  child: const Text('C', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
                ),
              ],
            ),
            const SizedBox(height: 20),
             if (resultado != '')
              Column(
                children: <Widget>[
                  Text(
                    'Resultado: ${resultado}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  
                ],
              ),
          ],
        ),
      ),
    );
  }
}

