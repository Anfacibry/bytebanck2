import 'package:flutter/material.dart';

class BotoesContainer extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final void Function() botao;
  const BotoesContainer({
    required this.icone,
    required this.titulo,
    required this.botao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: botao,
          child: SizedBox(
            height: 70,
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icone,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
