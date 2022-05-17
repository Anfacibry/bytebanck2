class ContaPessoa {
  final String? id;
  final String nomeConta;
  final String numeroConta;
  ContaPessoa({
    this.id,
    required this.nomeConta,
    required this.numeroConta,
  });

  @override
  String toString() {
    return "Contato Pessoa: Id: $id, Nome: $nomeConta, Numero: $numeroConta";
  }
}
