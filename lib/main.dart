import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFieds() {
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados";
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: _resetFieds,
              icon: Icon(Icons.refresh),
            )
          ]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person_outlined,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Peso (kg)"),
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              controller: weightController,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Altura (cm)"),
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              controller: heightController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
