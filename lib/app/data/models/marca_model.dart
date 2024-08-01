class MarcaModel {
  final String codigo;
  final String nome;

  MarcaModel({
    required this.codigo,
    required this.nome,
  });

  factory MarcaModel.fromJson(Map<String, dynamic> map) {
    return MarcaModel(
      codigo: map['codigo']?? '',
      nome: map['nome']?? '',
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Nome: $nome | Código: $codigo)';
  }
}
