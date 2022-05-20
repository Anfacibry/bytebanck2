import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/adicionando_contato.dart';
import 'package:bytebank/screens/transaction_form.dart';
import "package:flutter/material.dart";

import '../components/conta_pessoa.dart';

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
        title: const Text("Contas"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ContaPessoa>>(
        future: buscandoContas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ContaPessoa> listaContas = snapshot.data!;
            if (listaContas.isNotEmpty) {
              return ListView.builder(
                itemCount: listaContas.length,
                itemBuilder: (context, indice) => Card(
                  elevation: 3.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(
                            contact: listaContas[indice],
                          ),
                        ),
                      );
                    },
                    title: Text(
                      listaContas[indice].nomeConta,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      listaContas[indice].numeroConta,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          removendoContato(listaContas[indice]);
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
                  Text("Carregando contas"),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        onPressed: () {
          Future<ContaPessoa?> contatos = Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AdicionandoContato(),
            ),
          );
          contatos.then((contatoPego) {
            setState(() {
              salvandoContato(contatoPego!);
              debugPrint(contatoPego.toString());
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
