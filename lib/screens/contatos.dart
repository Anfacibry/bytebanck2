import "package:flutter/material.dart";

import '../components/contato_pessoa.dart';

class TelaContatos extends StatelessWidget {
  TelaContatos({Key? key}) : super(key: key);

  final List<ContatoPessoa> contatos = [
    ContatoPessoa(
      imagePerfil: "assets/image/gloria.jpg",
      nomePessoa: "Glória Cortez",
      numeroPessoa: "(99) 98436-9545",
    ),
    ContatoPessoa(
      imagePerfil: "assets/image/andreynna.jpg",
      nomePessoa: "Andreynna Braga",
      numeroPessoa: "(99) 98531-2650",
    ),
    ContatoPessoa(
      imagePerfil: "assets/image/dhef.jpg",
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
            leading: CircleAvatar(
              radius: 30,
              foregroundImage: AssetImage(contatos[indice].imagePerfil),
            ),
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
