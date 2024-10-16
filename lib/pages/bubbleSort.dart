import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Bubblesort extends StatelessWidget {
  const Bubblesort({super.key});

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
                  'Bubble Sort',
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
                  'Bubble Sort é um algoritmo de ordenação simples que organiza os elementos de uma lista ao comparar repetidamente pares adjacentes e trocar os elementos, se estiverem fora de ordem. O algoritmo funciona da seguinte maneira:\n\n'
                  '1. Comparação de Pares Adjacentes: O algoritmo percorre a lista comparando dois elementos adjacentes por vez.\n\n'
                  '2. Troca: Se os elementos comparados estiverem fora de ordem (o primeiro for maior que o segundo), eles são trocados de posição.\n\n'
                  '3. Iteração Completa: O processo é repetido para todos os pares da lista, "empurrando" o maior elemento para o final da lista.\n\n'
                  '4. Repetição: A iteração é repetida para o restante da lista, ignorando o último elemento a cada repetição, pois ele já estará ordenado. O processo continua até que não sejam necessárias mais trocas.',
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
                      'Comportamento do Bubble Sort',
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
                child: Image.asset('assets/images/bubble.gif'),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(
                        250, 227, 105, 37), // Cor da linha (borda)
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
