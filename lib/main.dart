import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Conversor de Temperatura",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade600,
          toolbarHeight: 42,
        ),
        body: Center(
          child: ConversorApp(),
        ),
      ),
    );
  }
}

class EntradaTemperatura extends StatefulWidget {
  final String unidadeTemperatura;
  
  const EntradaTemperatura({super.key, required this.unidadeTemperatura});

  @override
  State<StatefulWidget> createState() => _EntradaTemperatura();
}

class _EntradaTemperatura extends State<EntradaTemperatura> {
  late TextEditingController entradaController;

  @override
  void initState() {
    super.initState();
    entradaController = TextEditingController();
  }

  @override
  void dispose() {
    entradaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: entradaController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Temperatura em °${widget.unidadeTemperatura}",
        ),
      ),
    );
  }
}

class ConversorApp extends StatelessWidget {
  final String celsius = "C";
  final String fahrenheit = "F";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EntradaTemperatura(unidadeTemperatura: celsius),
        SizedBox(height: 30),
        Text("BOTAO"),
        SizedBox(height: 30),
        EntradaTemperatura(unidadeTemperatura: fahrenheit),
        SizedBox(height: 50),
        Text("RESULTADO")
      ],
    );
  }
}