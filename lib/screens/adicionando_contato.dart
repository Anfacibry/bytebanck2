import 'package:bytebank/components/conta_pessoa.dart';

import 'package:flutter/material.dart';

class AdicionandoContato extends StatefulWidget {
  const AdicionandoContato({Key? key}) : super(key: key);

  @override
  State<AdicionandoContato> createState() => _AdicionandoContatoState();
}

class _AdicionandoContatoState extends State<AdicionandoContato> {
  final TextEditingController _nomeContato = TextEditingController();
  final TextEditingController _numeroContato = TextEditingController();
  String? _erroTextNomeContato;
  String? _erroTextNumeroContato;

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
                decoration: InputDecoration(
                  labelText: "Nome e sobrenome",
                  labelStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: "Bya de Sousa",
                  border: const OutlineInputBorder(),
                  errorText: _erroTextNomeContato,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: TextField(
                  controller: _numeroContato,
                  decoration: InputDecoration(
                    labelText: "Número da conta",
                    labelStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: "2000",
                    border: const OutlineInputBorder(),
                    errorText: _erroTextNumeroContato,
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String _nome = _nomeContato.text;
                    final String _numero = _numeroContato.text;
                    if (_nome.isEmpty) {
                      setState(() {
                        _erroTextNomeContato = "Digite um nome e sobrenome";
                      });
                      return;
                    } else if (_numero.isEmpty) {
                      setState(() {
                        _erroTextNumeroContato = "Digite número para contato";
                      });
                      return;
                    }
                    final ContaPessoa contatoPessoa = ContaPessoa(
                      nomeConta: _nome,
                      numeroConta: _numero,
                    );
                    debugPrint(contatoPessoa.toString());
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
