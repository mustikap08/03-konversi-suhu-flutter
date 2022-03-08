import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  final temperaturController = TextEditingController();

  @override
  void dispose() {
    temperaturController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu - Mustika Putri Winarni_2031710060"),
        ),
        body: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: temperaturController,
                  decoration: const InputDecoration(
                      labelText: 'Masukkan Suhu dalam Celcius'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text("Suhu dalam Kelvin"),
                        Text(
                          _kelvin.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Suhu dalam Reamur"),
                        Text(
                          _reamur.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    convert();
                  },
                  child: const Text(
                    "Konversi",
                    style: TextStyle(fontSize: 24),
                  ),
                  color: Colors.brown,
                  textColor: Colors.white,
                  minWidth: double.maxFinite,
                  height: 55,
                )
              ],
            )),
      ),
    );
  }

  void convert() {
    _inputUser = double.parse(temperaturController.text);
    setState(() {
      _kelvin = _inputUser + 273.15;
      _reamur = _inputUser * 0.8;
    });
  }
}
