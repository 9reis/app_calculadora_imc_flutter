import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh),
            )
          ]),
      backgroundColor: Colors.white,
      body: Column(
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
          )
        ],
      ),
    );
  }
}
