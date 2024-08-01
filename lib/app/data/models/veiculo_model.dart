class VeiculoModel {
  final int TipoVeiculo;
  final String Valor;
  final String Marca;
  final String Modelo;
  final int AnoModelo;
  final String Combustivel;
  final String CodigoFipe;
  final String MesReferencia;
  final String SiglaCombustivel;

  VeiculoModel({
    required this.TipoVeiculo,
    required this.Valor,
    required this.Marca,
    required this.Modelo,
    required this.AnoModelo,
    required this.Combustivel,
    required this.CodigoFipe,
    required this.MesReferencia,
    required this.SiglaCombustivel,
  });

  factory VeiculoModel.fromMap(Map<String, dynamic> map) {
    return VeiculoModel(
      TipoVeiculo: map['TipoVeiculo'],
      Valor: map['Valor']?? '',
      Marca: map['Marca']?? '',
      Modelo: map['Modelo']?? '',
      AnoModelo: map['AnoModelo'],
      Combustivel: map['Combustivel']?? '',
      CodigoFipe: map['CodigoFipe']?? '',
      MesReferencia: map['MesReferencia']?? '',
      SiglaCombustivel: map['SiglaCombustivel']?? '',
    );
  }
}
