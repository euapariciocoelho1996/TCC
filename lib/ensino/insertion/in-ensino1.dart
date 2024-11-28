import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ensino/insertion/in-simula.dart';



class InsertionSortIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('O que é Insertion Sort?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              const Text(
                'O que é Insertion Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Parágrafo inicial
              const Text(
                'O Insertion Sort, ou "Ordenação por Inserção", é um algoritmo de ordenação simples. '
                'Ele constrói a lista ordenada um elemento de cada vez, inserindo cada novo elemento na posição correta. '
                'É eficiente para pequenas listas ou quando a maioria dos elementos já está ordenada.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              // Imagem ilustrativa
              Center(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/0/0f/Insertion-sort-example-300px.gif',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Subtítulo: Características
              const Text(
                'Características principais:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Lista de características
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint('Fácil de implementar.'),
                  bulletPoint('Bom para listas pequenas ou quase ordenadas.'),
                  bulletPoint('Possui complexidade O(n²) no pior caso.'),
                  bulletPoint('Ordenação estável (mantém a ordem relativa de elementos iguais).'),
                ],
              ),
              const SizedBox(height: 20),

              // Subtítulo: Como funciona
              const Text(
                'Como funciona o Insertion Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'O Insertion Sort funciona dividindo a lista em duas partes: a parte ordenada e a não ordenada. '
                'Os elementos da parte não ordenada são inseridos, um por um, na posição correta dentro da parte ordenada.',
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
                  bulletPoint('1. Comece com o segundo elemento da lista.'),
                  bulletPoint('2. Compare-o com os elementos da parte ordenada.'),
                  bulletPoint('3. Desloque os elementos maiores para a direita.'),
                  bulletPoint('4. Insira o elemento na posição correta.'),
                  bulletPoint('5. Repita para todos os elementos da parte não ordenada.'),
                ],
              ),
              const SizedBox(height: 20),

              // Subtítulo: Exemplo visual
              const Text(
                'Exemplo visual:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

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
                      'Lista inicial: [8, 3, 5, 2]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Passo 1: 3 é menor que 8 → Insere → [3, 8, 5, 2]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Passo 2: 5 é menor que 8 → Insere → [3, 5, 8, 2]',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Passo 3: 2 é menor que 3 → Insere → [2, 3, 5, 8]',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Botão para avançar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a próxima tela
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InsertionSortSimulation(),
                      ),
                    );
                  },
                  child: const Text('Experimente você mesmo!'),
                ),
              ),
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
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

