import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/foqueNoEssencial.dart';
import 'package:projeto_tcc_flutter/revisao/button-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo-rev.dart';
import 'package:projeto_tcc_flutter/t.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Bodyprincipal extends StatefulWidget {
  const Bodyprincipal({super.key});

  @override
  State<Bodyprincipal> createState() => _BodyprincipalState();
}

class _BodyprincipalState extends State<Bodyprincipal> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> messages = [
    "Bem-vindo ao nosso aplicativo!",
    "Aprenda algo novo todos os dias.",
    "Explore diferentes algoritmos de ordenação com facilidade.",
    "Melhore suas habilidades de programação.",
    "Obrigado por usar nosso aplicativo!",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Configura o timer para alternar as mensagens
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < messages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Volta ao início
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/1.png"), // Caminho da imagem
              fit: BoxFit.cover, // Ajusta a imagem ao tamanho da tela
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Alinhamento vertical
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
                            color: Color.fromARGB(255, 255, 255, 255),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 185, // Altura do container
                      width: 385,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(246, 224, 73, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              messages[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                        height: 20), // Espaço entre o slider e os pontos
                    // Pontinhos para indicar o slide atual
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: messages.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 4,
                        spacing: 16,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'ESTE APLICATIVO SERVE PARA MIM?\n\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    width: double.infinity,
                    height: 180,
                    alignment: Alignment.center,
                    child: const SingleChildScrollView(
                      // Permite a rolagem se o texto for longo
                      padding: EdgeInsets.all(10.0), // Adiciona padding
                      child: Text(
                        'Este aplicativo é voltado para estudantes interessados em tópicos relacionados a algoritmos de ordenação, oferecendo conteúdos interativos, exemplos práticos e exercícios que ajudam a consolidar o aprendizado de maneira dinâmica e envolvente.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
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

                    const Text(
                      'NOSTALGIA É NOSSO ESTILO',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      width: 215,
                      height: 2, // Espessura da linha
                      color: const Color.fromARGB(255, 0, 0, 0), // Cor da linha
                    ),
                    // Linha de baixo
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ButtonRevisao(),
              const SizedBox(height: 30),
              // Espaçamento entre os containers
              CustomRichText(
                  info: 'FOQUE NO', // Texto normal
                  title: 'ESSENCIAL'),
              const Foquenoessencial(),
            ],
          ),
        ),
      ],
    );
  }
}
