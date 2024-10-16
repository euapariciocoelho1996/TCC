import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/bodyPrincipal.dart';
import './foqueNoEssencial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Nome Aplicativo'), // appbar
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(250, 227, 105, 1),
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Página Inicial'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Sobre'),
              ),
            ],
          ),
        ),
      ),
      body: const Bodyprincipal(),
    );
  }
}
