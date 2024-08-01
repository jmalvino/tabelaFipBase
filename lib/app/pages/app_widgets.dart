import 'package:flutter/material.dart';
import 'package:tabela_fip_bse/app/pages/home/home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabela Fipe Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
