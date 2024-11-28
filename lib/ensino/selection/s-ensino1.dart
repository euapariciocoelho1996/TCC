import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ensino/selection/s-simula.dart';



class SelectionSortIntroduction extends StatelessWidget {
  const SelectionSortIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que é Selection Sort?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              const Text(
                'O que é Selection Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Parágrafo inicial
              const Text(
                'O Selection Sort, ou "Ordenação por Seleção", é um algoritmo de ordenação simples. '
                'Ele funciona repetidamente selecionando o menor (ou maior) elemento da lista e trocando-o com o elemento na posição inicial da parte não ordenada da lista. '
                'Esse processo é repetido até que a lista esteja completamente ordenada.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Imagem ilustrativa
              Center(
                child: Image.asset(
                  'assets/bubble/selection_gif.gif',
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
                  bulletPoint('É simples de implementar.'),
                  bulletPoint('Bom para listas pequenas.'),
                  bulletPoint('Possui complexidade O(n²) no pior caso.'),
                  bulletPoint(
                      'Ordenação não estável (pode alterar a ordem relativa de elementos iguais).'),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Como funciona o Selection Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              const Text(
                'O Selection Sort funciona realizando várias passagens pela lista. A cada passagem, ele seleciona o menor elemento da parte não ordenada e troca-o com o primeiro elemento dessa parte.',
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
                  bulletPoint(
                      '1. Encontre o menor elemento na lista não ordenada.'),
                  bulletPoint(
                      '2. Troque-o com o primeiro elemento não ordenado.'),
                  bulletPoint(
                      '3. Repita o processo para os elementos restantes.'),
                  bulletPoint(
                      '4. Continue até que todos os elementos estejam ordenados.'),
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
                      'Passo 1: Menor é 3 → Troca → [3, 5, 8, 6]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Passo 2: Menor é 5 → Troca → [3, 5, 8, 6]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Passo 3: Menor é 6 → Troca → [3, 5, 6, 8]',
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
                  // Navega para SelectionSortSimulation ao tocar
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionSortSimulation(),
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
