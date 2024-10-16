import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';

class Insertionsort extends StatelessWidget {
  const Insertionsort({super.key});

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
                  'Insertion Sort é um algoritmo de ordenação simples que organiza os elementos de uma lista ao construir uma parte ordenada de forma incremental, inserindo cada novo elemento na posição correta. O algoritmo funciona da seguinte maneira:\n\n'
                  '1. Divisão da Lista: A lista é inicialmente considerada parcialmente ordenada, com o primeiro elemento já na posição correta.\n\n'
                  '2. Seleção de Elemento: O algoritmo seleciona o próximo elemento da parte não ordenada.\n\n'
                  '3. Inserção na Parte Ordenada: O elemento selecionado é comparado com os elementos da parte ordenada e deslocado até que sua posição correta seja encontrada.\n\n'
                  '4. Repetição: O processo é repetido para cada elemento da lista até que todos estejam ordenados.\n\n',
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
                      'Comportamento do Insertion Sort',
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
                child: Image.asset('assets/images/insertion.gif'),
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
