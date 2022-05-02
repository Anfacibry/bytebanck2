class ContatoPessoa {
  final String nomePessoa;
  final String numeroPessoa;
  ContatoPessoa({
    required this.nomePessoa,
    required this.numeroPessoa,
  });

  @override
  String toString() {
    return "Contato: $nomePessoa Número: $numeroPessoa";
  }
}
