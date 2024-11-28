import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ensino/quick/q-simula.dart';


// Supondo que você tenha o arquivo da simulação do QuickSort

class QuickSortIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que é QuickSort?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                'O que é QuickSort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Parágrafo inicial
              Text(
                'O QuickSort é um algoritmo de ordenação eficiente baseado na técnica de divisão e conquista. '
                'Ele escolhe um "pivô" e organiza a lista de tal forma que os elementos menores que o pivô ficam à sua esquerda, '
                'e os maiores à sua direita. Esse processo é repetido recursivamente nas sublistas.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Imagem ilustrativa
              Center(
                child: Image.asset(
                  'assets/bubble/quick_sort_gif.gif',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Subtítulo: Características
              Text(
                'Características principais:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Lista de características
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint('É muito eficiente para listas grandes.'),
                  bulletPoint('A complexidade média é O(n log n).'),
                  bulletPoint('No pior caso, a complexidade é O(n²).'),
                  bulletPoint('É um algoritmo não estável.'),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Como funciona o QuickSort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              const Text(
                'O QuickSort funciona dividindo a lista em duas sublistas: uma com os elementos menores que o pivô e outra com os maiores. '
                'A recursão é aplicada a essas sublistas até que a lista esteja ordenada.',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Passo a passo:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Lista de passos
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint('1. Escolha um pivô da lista.'),
                  bulletPoint(
                      '2. Organize a lista com base no pivô: menores à esquerda, maiores à direita.'),
                  bulletPoint(
                      '3. Recursivamente aplique o processo nas sublistas à esquerda e à direita do pivô.'),
                  bulletPoint('4. Continue até que a lista esteja ordenada.'),
                ],
              ),
              SizedBox(height: 20),
              // Subtítulo: Exemplo visual
              Text(
                'Exemplo visual:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Exemplo visual simplificado
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue[50],
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  children: [
                    Text(
                      'Lista inicial: [5, 3, 8, 6]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Escolha do pivô: 5',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Reorganizando: [3, 5, 8, 6]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sublistas: [3], [5], [8, 6]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lista final: [3, 5, 6, 8]',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Botão para avançar
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  // Navega para QuickSortSimulation ao tocar
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuickSortSimulation(),
                    ),
                  );
                },
                child: const Text('Experimente você mesmo!'),
              )),
            ],
          ),
        ),
      ),
    );
  }

  // Função para criar itens de lista com marcadores
  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
