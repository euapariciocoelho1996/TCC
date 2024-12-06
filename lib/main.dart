import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/bodyPrincipal.dart';
import 'package:projeto_tcc_flutter/main-secundario.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/main': (context) => const HomeScreenSecundario(),
      },
      home: const HomeScreenLin1(),
    );
  }
}

class HomeScreenLin1 extends StatelessWidget {
  const HomeScreenLin1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Nome Aplicativo'), // appbar
      drawer: Drawer(
        child: Stack(
          children: [
            // Fundo do Drawer
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/1.png"), // Imagem de fundo
                  fit: BoxFit.cover, // Ajusta a imagem ao tamanho do Drawer
                ),
              ),
            ),
            // Conteúdo do Drawer
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Página Inicial',
                      style: TextStyle(
                        color: Colors.white, // Cor do texto
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      'Configurações',
                      style: TextStyle(
                        color: Colors.white, // Cor do texto
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Colors.white),
                    title: Text(
                      'Sobre',
                      style: TextStyle(
                        color: Colors.white, // Cor do texto
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Bodyprincipal(),
    );
  }
}
