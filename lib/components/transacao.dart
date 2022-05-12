import 'conta_pessoa.dart';

class Transacao {
  final double? valor;
  final ContaPessoa? contato;

  const Transacao({
    required this.valor,
    required this.contato,
  });

  @override
  String toString() {
    return 'Transaction{value: $valor, contact: $contato}';
  }
}
