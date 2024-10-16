import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Quicksort extends StatelessWidget {
  const Quicksort({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: customAppBar('Nome Aplicativo'),
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
                  'Quick Sort é um algoritmo de ordenação eficiente que segue o paradigma de divisão e conquista, escolhendo um elemento como pivô e reorganizando os elementos em torno dele. O algoritmo funciona da seguinte maneira:\n\n'
                  '1. Escolha do Pivô: Um elemento da lista é escolhido como pivô (geralmente o primeiro, o último ou um elemento aleatório).\n\n'
                  '2. Particionamento: Os elementos da lista são reorganizados de forma que os menores que o pivô fiquem à sua esquerda e os maiores à sua direita.\n\n'
                  '3. Ordenação Recursiva: O processo é repetido recursivamente para as sublistas à esquerda e à direita do pivô.\n\n'
                  '4. Repetição: Isso continua até que todas as sublistas tenham tamanho 1, resultando em uma lista completamente ordenada.',
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
                      'Comportamento do Quick Sort',
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
                child: Image.asset('assets/images/quick.gif'),
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
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
