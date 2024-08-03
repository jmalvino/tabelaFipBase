import 'package:flutter/material.dart';
import 'package:tabela_fip_bse/app/screens/consulta_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
        title: Text(
          'Consulta Tabela FIPE',
          style: TextStyle(color: Colors.deepPurple[100]),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[400],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ConsultaScreen()),
            );
          },
          child: const Text('Consultar Veículos'),
        ),
      ),
    );
  }
}
