import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabela_fip_bse/app/data/models/ano_model.dart';
import 'package:tabela_fip_bse/app/data/models/marca_model.dart';
import 'package:tabela_fip_bse/app/data/models/modelo_model.dart';
import 'package:tabela_fip_bse/app/data/models/veiculo_model.dart';


class FipeProvider extends ChangeNotifier {
  final String baseUrl = "https://parallelum.com.br/fipe/api/v1/carros";

  List<Marca> _marcas = [];
  List<Modelo> _modelos = [];
  List<Ano> _anos = [];
  Veiculo? _veiculo;

  String? _selectedMarca;
  String? _selectedModelo;
  String? _selectedAno;

  List<Marca> get marcas => _marcas;
  List<Modelo> get modelos => _modelos;
  List<Ano> get anos => _anos;
  Veiculo? get veiculo => _veiculo;

  String? get selectedMarca => _selectedMarca;
  String? get selectedModelo => _selectedModelo;
  String? get selectedAno => _selectedAno;

  set selectedMarca(String? marca) {
    _selectedMarca = marca;
    notifyListeners();
  }

  set selectedModelo(String? modelo) {
    _selectedModelo = modelo;
    notifyListeners();
  }

  set selectedAno(String? ano) {
    _selectedAno = ano;
    notifyListeners();
  }

  Future<void> fetchMarcas() async {
    final response = await http.get(Uri.parse('$baseUrl/marcas'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _marcas = data.map((json) => Marca.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Falha ao carregar marcas');
    }
  }

  Future<void> fetchModelos(String marca) async {
    final response = await http.get(Uri.parse('$baseUrl/marcas/$marca/modelos'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      _modelos = (data['modelos'] as List).map((json) => Modelo.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Falha ao carregar modelos');
    }
  }

  Future<void> fetchAnos(String marca, String modelo) async {
    final response = await http.get(Uri.parse('$baseUrl/marcas/$marca/modelos/$modelo/anos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _anos = data.map((json) => Ano.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Falha ao carregar anos');
    }
  }

  Future<void> fetchVeiculo(String marca, String modelo, String ano) async {
    final response = await http.get(Uri.parse('$baseUrl/marcas/$marca/modelos/$modelo/anos/$ano'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      _veiculo = Veiculo.fromJson(data);
      notifyListeners();
    } else {
      throw Exception('Falha ao carregar veículo');
    }
  }
}
