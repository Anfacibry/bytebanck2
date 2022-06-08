import 'package:flutter/material.dart';

class AlertaDialogo extends StatefulWidget {
  final void Function(String senha) senha;
  const AlertaDialogo({
    required this.senha,
    Key? key,
  }) : super(key: key);

  @override
  State<AlertaDialogo> createState() => _AlertaDialogoState();
}

class _AlertaDialogoState extends State<AlertaDialogo> {
  final TextEditingController _senhaPego = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Autenticação",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      //Caixa de Texto de autenticação de Senha
      content: TextField(
        controller: _senhaPego,
        keyboardType: TextInputType.number,
        obscureText: true,
        maxLength: 4,
        style: const TextStyle(
          fontSize: 60,
          letterSpacing: 20,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )),
        ),
        cursorColor: Theme.of(context).primaryColor,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.senha(_senhaPego.text);
            Navigator.pop(context);
          },
          child: Text(
            "Confirmar",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.end,
    );
  }
}
