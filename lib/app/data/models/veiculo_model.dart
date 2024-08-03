class Veiculo {
  final String tipoVeiculo;
  final String valor;
  final String marca;
  final String modelo;
  final int anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String mesReferencia;
  final String siglaCombustivel;

  Veiculo({
    required this.tipoVeiculo,
    required this.valor,
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.codigoFipe,
    required this.mesReferencia,
    required this.siglaCombustivel,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json) {
    return Veiculo(
      tipoVeiculo: json['TipoVeiculo'].toString(),
      valor: json['Valor'],
      marca: json['Marca'],
      modelo: json['Modelo'],
      anoModelo: json['AnoModelo'],
      combustivel: json['Combustivel'],
      codigoFipe: json['CodigoFipe'],
      mesReferencia: json['MesReferencia'],
      siglaCombustivel: json['SiglaCombustivel'],
    );
  }
}
