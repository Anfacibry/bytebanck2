import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/adicionando_contato.dart';
import "package:flutter/material.dart";

import '../components/contato_pessoa.dart';

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
          if (snapshot.hasData) {
            final List<ContatoPessoa> listaContatos = snapshot.data!;
            if (listaContatos.isNotEmpty) {
              return ListView.builder(
                itemCount: listaContatos.length,
                itemBuilder: (context, indice) => Card(
                  elevation: 3.0,
                  child: ListTile(
                    title: Text(
                      listaContatos[indice].nomePessoa,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      listaContatos[indice].numeroPessoa,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          removendoContato(listaContatos[indice]);
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
            } else {
              return const Center(
                child: Text("Lista de contatos vazia"),
              );
            }
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("Carregando contatos"),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        onPressed: () {
          Future<ContatoPessoa?> contatos = Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AdicionandoContato(),
            ),
          );
          contatos.then((contatoPego) {
            setState(() {
              salvandoContato(contatoPego!);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
