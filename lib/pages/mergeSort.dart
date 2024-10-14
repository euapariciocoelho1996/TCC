import 'package:flutter/material.dart';

class Mergesort extends StatelessWidget {
  const Mergesort({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Ação ao clicar no ícone de notificações
            },
          ),
        ],
        title: const Text(
          'NOME APLICATIVO',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 14, // Define o tamanho da fonte do título
            fontWeight: FontWeight.normal, // Define o peso da fonte
          ),
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor: const Color.fromRGBO(250, 227, 105, 37),
        // backgroundColor: const Color.fromRGBO(250, 227, 105, 37),
        // Cor de fundo do AppBar
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  'Insertion Sort',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(237, 133, 59, 1),
                  ),
                ),
              ),
              Container(
                height: 500,
                width: 370,
                child: const Text(
                  'Merge Sort é um algoritmo de ordenação eficiente que segue o paradigma de divisão e conquista, dividindo a lista em partes menores até que cada sublista tenha um único elemento e, em seguida, mesclando-as de forma ordenada. O algoritmo funciona da seguinte maneira:\n\n'
                  '1. Divisão Recursiva: A lista é recursivamente dividida ao meio até que cada sublista contenha apenas um elemento.\n\n'
                  '2. Comparação e Fusão: Cada par de sublistas é comparado e fundido, criando sublistas maiores que estão em ordem.\n\n'
                  '3. Mesclagem: Os elementos das sublistas são comparados e combinados em uma nova lista ordenada.\n\n'
                  '4. Repetição: O processo de fusão continua até que todas as sublistas sejam mescladas em uma única lista ordenada.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    // Linha de cima
                    Container(
                      width: 215,
                      height: 2, // Espessura da linha
                      color: const Color.fromARGB(255, 0, 0, 0), // Cor da linha
                    ),
                    // Conteúdo do container
                    const SizedBox(height: 15),
                    const Text(
                      'Comportamento do Merge Sort',
                      style: TextStyle(
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        fontSize: 18,
                      ),
                    ),
                    // Linha de baixo
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 278,
                height: 200,
                child: Image.asset('assets/images/merge.gif'),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 255, 241, 87), // Cor da linha (borda)
                    width: 4.0, // Espessura da linha
                  ),
                ),
              ),
              Container(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
