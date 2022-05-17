import 'package:bytebank/screens/contatos.dart';
import 'package:bytebank/screens/lista_transacao.dart';
import 'package:flutter/material.dart';

import '../models/botoes.dart';

class TelaDashboard extends StatelessWidget {
  final String titulo;
  const TelaDashboard({required this.titulo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/image/bytebank_logo.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Row(
              children: [
                BotoesContainer(
                  icone: Icons.people,
                  titulo: "Contatos",
                  botao: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => const TelaContatos(),
                      ),
                    );
                  },
                ),
                BotoesContainer(
                  icone: Icons.monetization_on,
                  titulo: "Transferência",
                  botao: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ListaTransacao(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
