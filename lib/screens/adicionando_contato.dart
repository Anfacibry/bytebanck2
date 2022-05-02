import 'package:bytebank/components/contato_pessoa.dart';
import 'package:flutter/material.dart';

class AdicionandoContato extends StatefulWidget {
  const AdicionandoContato({Key? key}) : super(key: key);

  @override
  State<AdicionandoContato> createState() => _AdicionandoContatoState();
}

class _AdicionandoContatoState extends State<AdicionandoContato> {
  final TextEditingController _nomeContato = TextEditingController();
  final TextEditingController _numeroContato = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionando contato"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nomeContato,
                decoration: const InputDecoration(
                  labelText: "Nome e sobrenome",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: "Bya de Sousa",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: TextField(
                  controller: _numeroContato,
                  decoration: const InputDecoration(
                    labelText: "Número com DDD",
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: "(99) 99999-9999",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String _nome = _nomeContato.text;
                    final String _numero = _numeroContato.text;
                    final ContatoPessoa contatoPessoa = ContatoPessoa(
                      nomePessoa: _nome,
                      numeroPessoa: _numero,
                    );
                    Navigator.pop(context, contatoPessoa);
                  },
                  child: const Text("Salvar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
