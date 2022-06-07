import 'package:flutter/material.dart';

class AlertaDialogo extends StatelessWidget {
  const AlertaDialogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: const Text(
          "Autenticação",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: const TextField(
          keyboardType: TextInputType.number,
          obscureText: true,
          maxLength: 4,
          style: TextStyle(
            fontSize: 60,
            letterSpacing: 20,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            )),
          ),
          cursorColor: Colors.black,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Confirmar",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
        actionsAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
