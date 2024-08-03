import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabela_fip_bse/app/screens/home_screen.dart';
import 'providers/fipe_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FipeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tabela FIPE',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
