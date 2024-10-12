import 'package:flutter/material.dart';

class Selectionsort extends StatelessWidget {
  const Selectionsort({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 3, 53),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'NOME APLICATIVO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14, // Define o tamanho da fonte do título
            fontWeight: FontWeight.normal, // Define o peso da fonte
          ),
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor: const Color.fromARGB(255, 4, 3, 53),
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
                  'Selection Sort',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 480,
                width: 370,
                child: const Text(
                  'Selection Sort é um algoritmo de ordenação simples que organiza os elementos de uma lista ao dividir a lista em duas partes: a parte ordenada e a parte não ordenada. O algoritmo funciona da seguinte maneira:\n\n'
                  '1. Divisão da Lista: A lista é inicialmente considerada toda não ordenada.\n\n'
                  '2. Iteração: O algoritmo percorre toda a parte não ordenada da lista para encontrar o menor (ou maior) elemento.\n\n'
                  '3. Troca: Após identificar o menor elemento, ele é trocado com o primeiro elemento da parte não ordenada, movendo-o para a parte ordenada.\n\n'
                  '4. Repetição: O processo é repetido para o restante da lista, cada vez reduzindo a parte não ordenada.',
                  style: TextStyle(
                    color: Colors.white,
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
                      color: const Color.fromARGB(
                          255, 255, 241, 87), // Cor da linha
                    ),
                    // Conteúdo do container
                    const SizedBox(height: 15),
                    const Text(
                      'Comportamento do Selection Sort',
                      style: TextStyle(
                        color: Colors.white,
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
                child: Image.asset('assets/images/selection.gif'),
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
