import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import './foqueNoEssencial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: ListView(
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Alinhamento vertical
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Alinhamento horizontal
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Alinha horizontalmente os widgets no início
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Centraliza verticalmente os widgets
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Centraliza os textos verticalmente
                          children: [
                            Text(
                              'Olá,',
                              style: TextStyle(
                                color: Color.fromRGBO(237, 133, 59, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' que bom ter você aqui!',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(8, 30, 0,
                            0), // Margem adicional para separar da linha de texto
                        height: 28,
                        width: 28,
                        child: Image.asset('assets/images/hand-ola.png'),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Aproveite ao máximo esta experiência!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    width: double.infinity, // Ocupa 100% da largura
                    height: 181,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 227, 105, 1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            4.0,
                            4.0,
                          ),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 180,
                          height: 200,
                          child: Image.asset('assets/images/BLOCO.png'),
                        ),
                        Container(
                          width: 180,
                          height: 140,
                          margin: const EdgeInsets.only(right: 10),
                          child: const Center(
                            child: Text(
                              'Para garantir a melhor jornada, tenha uma base sólida em algoritmos!',
                              style: TextStyle(
                                fontWeight: FontWeight
                                    .bold, // Define o texto como negrito
                                fontSize:
                                    16, // Você pode ajustar o tamanho da fonte
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          'ESTE APLICATIVO SERVE PARA MIM?\n\n',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        width: double.infinity,
                        height: 180,
                        alignment: Alignment.center,
                        child: const SingleChildScrollView(
                          // Permite a rolagem se o texto for longo
                          padding: EdgeInsets.all(13.0), // Adiciona padding
                          child: Text(
                            'Este aplicativo é voltado para estudantes interessados em tópicos relacionados a algoritmos de ordenação, oferecendo conteúdos interativos, exemplos práticos e exercícios que ajudam a consolidar o aprendizado de maneira dinâmica e envolvente.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Espaçamento entre os containers

                  Container(
                    child: Column(
                      children: [
                        // Conteúdo do container
                        const SizedBox(height: 15),
                        const Text(
                          'FOQUE NO ESSENCIAL',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 215,
                          height: 2, // Espessura da linha
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // Cor da linha
                        ),
                        // Linha de baixo
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Espaçamento entre os containers
                  const Foquenoessencial(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
