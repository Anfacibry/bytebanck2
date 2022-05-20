import 'conta_pessoa.dart';

class Transacao {
  final String? id;
  final double? valor;
  final ContaPessoa? contato;

  const Transacao({
    this.id,
    required this.valor,
    required this.contato,
  });

  @override
  String toString() {
    return 'Transaction{id: $id, value: $valor, contact: $contato}';
  }
}
