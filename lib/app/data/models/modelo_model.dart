class ModeloModel {
  final int codigo;
  final String nome;

  ModeloModel({
    required this.codigo,
    required this.nome,
  });

  factory ModeloModel.froJson(Map<String, dynamic> json) {
    return ModeloModel(
      codigo: json['codigo'] as int,
      nome: json['nome']?? "",
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Nome: $nome | Codigo: $codigo';
  }
}

class AnoModel {
  final String codigo;
  final String nome;

  AnoModel({required this.codigo, required this.nome});

  factory AnoModel.fromJson(Map<String, dynamic> json) {
    return AnoModel(
      codigo: json['codigo']?? '',
      nome: json['nome']?? '',
    );
  }

  @override
  String toString() {
    return 'Nome: $nome | Código: $codigo)';
  }
}

class ModelosModelResponse {
  final List<ModeloModel> modelos;
  final List<AnoModel> anos;

  ModelosModelResponse({required this.modelos, required this.anos});

  factory ModelosModelResponse.fromJson(Map<String, dynamic> json) {
    var modelosList = json['modelos'] as List;
    var anosList = json['anos'] as List;

    List<ModeloModel> modelos = modelosList.map((i) => ModeloModel.froJson(i))
        .toList();
    List<AnoModel> anos = anosList.map((i) => AnoModel.fromJson(i)).toList();

    return ModelosModelResponse(
      modelos: modelos,
      anos: anos,
    );
  }
}