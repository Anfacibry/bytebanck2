import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/adicionando_contato.dart';
import "package:flutter/material.dart";

import '../components/contato_pessoa.dart';
import '../database/contatos.dart';

class TelaContatos extends StatefulWidget {
  const TelaContatos({Key? key}) : super(key: key);

  @override
  State<TelaContatos> createState() => _TelaContatosState();
}

class _TelaContatosState extends State<TelaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ContatoPessoa>>(
        future: buscandoContatos(),
        builder: (context, snapshot) {
          final List<ContatoPessoa> contatos;
          if (snapshot.hasData) {
            contatos = snapshot.data!;
          } else {
            contatos = [];
          }

          return ListView.builder(
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
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      removendoContato(contatos[indice]);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          );
        },
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
              salvandoContato(contatPego!).then((indice) {
                contatos[indice];
              });
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
