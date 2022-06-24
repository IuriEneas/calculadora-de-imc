import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _HomeState();
}

class _HomeState extends State<MyWidget> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String result = "Informe seus dados!";

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      result = "Informe seus dados!";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double total = weight / (height * height);

      if (total < 18.6) {
        result = "Abaixo do peso (${total.toStringAsPrecision(3)})";
      } else if (total >= 18.6 && total < 24.9) {
        result = "Peso ideal (${total.toStringAsPrecision(3)})";
      } else if (total >= 24.9 && total < 29.9) {
        result = "Levemente acima do peso (${total.toStringAsPrecision(3)})";
      } else if (total >= 29.9 && total < 34.9) {
        result = "Obesidade grau I (${total.toStringAsPrecision(3)})";
      } else if (total >= 34.9 && total < 39.9) {
        result = "Obesidade grau II (${total.toStringAsPrecision(3)})";
      } else if (total >= 40) {
        result = "Obesidade grau III (${total.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 220,
              color: Colors.green,
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
