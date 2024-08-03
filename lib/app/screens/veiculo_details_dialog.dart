import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabela_fip_bse/providers/fipe_provider.dart';

class VeiculoDetailsDialog extends StatelessWidget {
  const VeiculoDetailsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final veiculo = Provider.of<FipeProvider>(context).veiculo;

    return AlertDialog(
      backgroundColor: Colors.grey[800],
      title: const Text(
        'Detalhes do Veículo',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      content: veiculo == null
          ? const CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                textFormat('Marca:', veiculo.marca),
                textFormat('Modelo:', veiculo.modelo),
                textFormat('Ano:', '${veiculo.anoModelo}'),
                textFormat('Combustível:', veiculo.combustivel),
                textFormat('Valor:', veiculo.valor),
                textFormat('Mês de Referência:', veiculo.mesReferencia),
              ],
            ),
      actions: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[400],
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar', style: TextStyle(
              color: Colors.deepPurple,
            ),),
          ),
        ),
      ],
    );
  }

  Widget textFormat(String text, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.deepPurple[100],
            ),
          ),
          Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
