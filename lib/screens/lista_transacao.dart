import 'package:bytebank/http/web_cliente.dart';
import 'package:flutter/material.dart';

import '../components/transacao.dart';

class ListaTransacao extends StatefulWidget {
  const ListaTransacao({Key? key}) : super(key: key);

  @override
  State<ListaTransacao> createState() => _ListaTransacaoState();
}

class _ListaTransacaoState extends State<ListaTransacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Transacao>?>(
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //Estado sem conexão
              case ConnectionState.none:

              //Estado de conexão em espera
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("Carregando Transferencias"),
                    ],
                  ),
                );

              //Estado de Conexão ativa
              case ConnectionState.active:
                break;
              //Estado de conexão feita
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transacao> transacao = snapshot.data!;
                  if (transacao.isNotEmpty) {
                    return ListView.builder(
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
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Lista de transferencias vazia"),
                    );
                  }
                }
            }
            return const Center(
              child: Text("Erro ao carregar"),
            );
          }),
    );
  }
}
