import 'package:bytebank/http/web_cliente.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank());
  findAll();
}

class Bytebank extends StatelessWidget {
  final String nomeApp = "Dashboard";
  const Bytebank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: nomeApp,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TelaDashboard(
        titulo: nomeApp,
      ),
    );
  }
}
