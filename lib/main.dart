import 'package:flutter/material.dart';
import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        useMaterial3: true, // Habilitar Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6750A4)), // Usar el color semilla
      ),
      home: CalculatorHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = '0';
  String operation = '0';
  String operationView = '0';
  Calculator calculator = Calculator(); // Instancia del controlador
  // Función para manejar la pulsación de los botones
  void buttonPressed(String value) {
    setState(() {
      if (value == "Borrar") {
        operation = '0';
        output = '0';
        operationView='0';
      } else if (value == "=") {
        try {
          double result = calculator.calculate(operation); // Llama a la función de cálculo
          output = result.toString(); // Muestra el resultado
          operationView=operation;
          operation=output;
        } catch (e) {
          output = "Error"; // Maneja cualquier error de cálculo
        }
      } else {
        if (operation == '0') {
          operation= value;
        } else {
          operation += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      backgroundColor: const Color(0xFF6750A4),
      body: Container(
        color:  Colors.white,
        child: Column(

          children: [
            Container(
              width:double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color:Color(0xFFE7E0EC),
                border: Border.all(color: Colors.black26, width: 1.5),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    operationView,
                    style: const TextStyle(fontSize: 30,color: Color(0xFF21005D)),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    operation,
                    style: const TextStyle(fontSize: 30,color: Color(0xFF21005D)),
                  ),
                ],
              ),
            ),
            // Tabla para los botones
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Table(

                  children: [
                    TableRow(
                      children: [
                        buildButton('(',Color(0xFF6750A4)),
                        buildButton(')',Color(0xFF6750A4)),
                        buildButton('/', Color(0xFF6750A4)),
                        buildButton('Borrar',Color(0xFF7D5260))
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('7', Color(0xFFEADDFF)),
                        buildButton('8', Color(0xFFEADDFF)),
                        buildButton('9', Color(0xFFEADDFF)),
                        buildButton('*',Color(0xFF6750A4)),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('4', Color(0xFFEADDFF)),
                        buildButton('5', Color(0xFFEADDFF)),
                        buildButton('6', Color(0xFFEADDFF)),
                        buildButton('-', Color(0xFF6750A4)),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('1', Color(0xFFEADDFF)),
                        buildButton('2', Color(0xFFEADDFF)),
                        buildButton('3', Color(0xFFEADDFF)),
                        buildButton('+', Color(0xFF6750A4)),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('0', Color(0xFFEADDFF)),
                        const SizedBox.shrink(),
                        buildButton('.',Color(0xFF6750A4)),
                        buildButton('=', Color(0xFF6750A4)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función auxiliar para crear los botones
  Widget buildButton(String value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ElevatedButton(
        onPressed: () => buttonPressed(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Color de fondo del botón
          foregroundColor: Colors.white, // Texto en blanco
          padding: const EdgeInsets.all(23), // Ajuste de tamaño del botón
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
