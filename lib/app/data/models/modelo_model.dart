class Modelo {
  final String codigo;
  final String nome;

  Modelo({required this.codigo, required this.nome});

  factory Modelo.fromJson(Map<String, dynamic> json) {
    return Modelo(
      codigo: json['codigo'].toString(),
      nome: json['nome'],
    );
  }
}
