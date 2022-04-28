import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank());
}

class Bytebank extends StatelessWidget {
  final String nomeApp = "Bytebank";
  const Bytebank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nomeApp,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bytebank"),
        centerTitle: true,
      ),
    );
  }
}
