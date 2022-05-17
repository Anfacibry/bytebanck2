import 'conta_pessoa.dart';

class Transacao {
  final String id;
  final double? valor;
  final ContaPessoa? contato;

  const Transacao({
    required this.id,
    required this.valor,
    required this.contato,
  });

  @override
  String toString() {
    return 'Transaction{Id: $id, value: $valor, contact: $contato}';
  }
}
