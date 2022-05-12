import 'package:bytebank/components/conta_pessoa.dart';
import 'package:flutter/material.dart';

import '../components/transacao.dart';

class ListaTransacao extends StatelessWidget {
  final List<Transacao> transacao = [];

  ListaTransacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    transacao.add(
      Transacao(
        valor: 100,
        contato: ContaPessoa(
          id: 0,
          nomeConta: "Bruno",
          numeroConta: "1000",
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: transacao.length,
        itemBuilder: (context, index) {
          final Transacao transaction = transacao[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text(
                transaction.valor.toString(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contato!.nomeConta.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
