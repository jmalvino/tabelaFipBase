import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabela_fip_bse/providers/fipe_provider.dart';
import 'veiculo_details_dialog.dart';

class ConsultaScreen extends StatefulWidget {
  const ConsultaScreen({Key? key}) : super(key: key);

  @override
  _ConsultaScreenState createState() => _ConsultaScreenState();
}

class _ConsultaScreenState extends State<ConsultaScreen> {
  @override
  void initState() {
    super.initState();
    final fipeProvider = Provider.of<FipeProvider>(context, listen: false);
    fipeProvider.fetchMarcas();
  }

  @override
  Widget build(BuildContext context) {
    final fipeProvider = Provider.of<FipeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[800],
        title: textCuston(
          'Consultar Veículos',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              DropdownButtonCuston(
                DropdownButton<String>(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  dropdownColor: Colors.grey[900],
                  hint: textCuston('Selecione uma marca'),
                  value: fipeProvider.selectedMarca,
                  onChanged: (String? newValue) async {
                    fipeProvider.selectedMarca = newValue;
                    if (newValue != null) {
                      await fipeProvider.fetchModelos(newValue);
                    }
                  },
                  items: fipeProvider.marcas.map((marca) {
                    return DropdownMenuItem<String>(
                      value: marca.codigo,
                      child: Text(marca.nome),
                    );
                  }).toList(),
                ),
              ),
              if (fipeProvider.selectedMarca == null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textCuston(
                      'Por favor, selecione uma marca para continuar'),
                ),
              if (fipeProvider.selectedMarca != null)
                DropdownButtonCuston(
                  DropdownButton<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    dropdownColor: Colors.grey[900],
                    hint: textCuston('Selecione um modelo'),
                    value: fipeProvider.selectedModelo,
                    onChanged: (String? newValue) async {
                      fipeProvider.selectedModelo = newValue;
                      if (newValue != null &&
                          fipeProvider.selectedMarca != null) {
                        await fipeProvider.fetchAnos(
                            fipeProvider.selectedMarca!, newValue);
                      }
                    },
                    items: fipeProvider.modelos.map((modelo) {
                      return DropdownMenuItem<String>(
                        value: modelo.codigo,
                        child: Text(modelo.nome),
                      );
                    }).toList(),
                  ),
                ),
              if (fipeProvider.selectedModelo != null)
                DropdownButtonCuston(
                  DropdownButton<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    dropdownColor: Colors.grey[900],
                    hint: textCuston('Selecione o ano'),
                    value: fipeProvider.selectedAno,
                    onChanged: (String? newValue) {
                      fipeProvider.selectedAno = newValue;
                    },
                    items: fipeProvider.anos.map((ano) {
                      return DropdownMenuItem<String>(
                        value: ano.codigo,
                        child: Text(ano.nome),
                      );
                    }).toList(),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                ),
                onPressed: () async {
                  if (fipeProvider.selectedMarca != null &&
                      fipeProvider.selectedModelo != null &&
                      fipeProvider.selectedAno != null) {
                    await fipeProvider.fetchVeiculo(
                      fipeProvider.selectedMarca!,
                      fipeProvider.selectedModelo!,
                      fipeProvider.selectedAno!,
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const VeiculoDetailsDialog();
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: textCuston(
                            'Selecione todos os campos para continuar'),
                      ),
                    );
                  }
                },
                child: const Text('Consultar Detalhes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DropdownButtonCuston(DropdownButton<String> dropdown) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.deepPurple[300]!, width: 2.0),
        ),
        child: DropdownButtonHideUnderline(
          child: dropdown,
        ),
      ),
    );
  }

  Widget textCuston(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
