import 'package:bytebank/screens/adicionando_contato.dart';
import "package:flutter/material.dart";

import '../components/contato_pessoa.dart';

class TelaContatos extends StatefulWidget {
  const TelaContatos({Key? key}) : super(key: key);

  @override
  State<TelaContatos> createState() => _TelaContatosState();
}

class _TelaContatosState extends State<TelaContatos> {
  final List<ContatoPessoa> contatos = [
    ContatoPessoa(
      nomePessoa: "Glória Cortez",
      numeroPessoa: "(99) 98436-9545",
    ),
    ContatoPessoa(
      nomePessoa: "Andreynna Braga",
      numeroPessoa: "(99) 98531-2650",
    ),
    ContatoPessoa(
      nomePessoa: "Dheferson",
      numeroPessoa: "(99) 98400-9769",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, indice) => Card(
          elevation: 3.0,
          child: ListTile(
            title: Text(
              contatos[indice].nomePessoa,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              contatos[indice].numeroPessoa,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        onPressed: () {
          final Future<ContatoPessoa?> contato = Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AdicionandoContato(),
            ),
          );
          contato.then((contatPego) {
            setState(() {
              contatos.add(contatPego!);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
