import 'package:bytebank/components/alerta_dialogo.dart';
import 'package:bytebank/components/conta_pessoa.dart';
import 'package:bytebank/components/transacao.dart';

import 'package:bytebank/http/web_cliente.dart';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final ContaPessoa contact;

  const TransactionForm({
    required this.contact,
    Key? key,
  }) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova transação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.contact.nomeConta,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.numeroConta,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Valor'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transferência'),
                    onPressed: () {
                      final double valor = double.parse(_valueController.text);
                      final Transacao transactionCreated =
                          Transacao(valor: valor, contato: widget.contact);

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertaDialogo(
                              senha: (String senhaPego) {
                                salvandoTranferencia(
                                  transacao: transactionCreated,
                                  senha: senhaPego,
                                );
                                _valueController.clear();
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
