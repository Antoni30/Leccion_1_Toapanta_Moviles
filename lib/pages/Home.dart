import 'package:flutter/material.dart';
import 'package:leccion_toapanta/libs/CalcularPeso.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Calcularpeso calcularPeso = Calcularpeso(); // Instancia de Calcularpeso
  double _pesoActual = 0.0;
  double _pesoTotal = 0.0;
  int numPersonas = 100;
  String _resultado = '0';
  final TextEditingController _pesoController = TextEditingController();

  void _agregarPeso() {
    setState(() {
      if (_pesoController.text.isNotEmpty) {
        _pesoActual = double.tryParse(_pesoController.text) ?? 0.0;

        _pesoTotal = calcularPeso.calcular(_pesoActual, _pesoTotal, numPersonas);

        numPersonas--; 
        _pesoController.clear();

        if (numPersonas == 0) {
          _resultado = 'La suma total de los pesos es $_pesoTotal kg';
        } else {
          _resultado = 'Personas restantes: $numPersonas';
        }
      }
    });
  }

  @override
  void dispose() {
    _pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular suma de Pesos"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ingrese el peso de la persona:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Peso en kg',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _agregarPeso,
              child: const Text("Agregar Peso"),
            ),
            const SizedBox(height: 16),
            Text(
              "El peso actual sumado es $_pesoTotal kg",
              style: TextStyle(fontSize: 18, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
