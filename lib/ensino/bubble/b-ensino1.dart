import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ensino/bubble/b-simula.dart';



class BubbleSortIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que é Bubble Sort?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                'O que é Bubble Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Parágrafo inicial
              Text(
                'O Bubble Sort, ou "Ordenação por Bolha", é um algoritmo de ordenação simples. Ele funciona '
                'repetidamente comparando pares de elementos adjacentes em uma lista, trocando-os de posição '
                'se estiverem na ordem errada. Esse processo é repetido até que a lista esteja ordenada.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Imagem ilustrativa
              Center(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif',
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
                  bulletPoint('É fácil de implementar.'),
                  bulletPoint('Bom para listas pequenas.'),
                  bulletPoint('Possui complexidade O(n²) no pior caso.'),
                  bulletPoint(
                      'Ordenação estável (não altera a ordem relativa de elementos iguais).'),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'Como funciona o Bubble Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              const Text(
                'O Bubble Sort funciona realizando várias passagens pela lista. A cada passagem, '
                'ele compara pares de elementos adjacentes e troca-os de posição se estiverem fora de ordem.',
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
                  bulletPoint('1. Compare o primeiro par de elementos.'),
                  bulletPoint('2. Troque-os se necessário.'),
                  bulletPoint('3. Passe para o próximo par e repita.'),
                  bulletPoint('4. Continue até o fim da lista.'),
                  bulletPoint(
                      '5. Repita o processo, ignorando o último elemento ordenado.'),
                ],
              ),
              SizedBox(height: 20),
              // Subtítulo: Exemplo visual
              const Text(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lista inicial: [5, 3, 8, 6]',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Passo 1: Comparar 5 e 3',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '5 > 3 → Trocar → [3, 5, 8, 6]',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Passo 2: Comparar 8 e 6',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '8 > 6 → Trocar → [3, 5, 6, 8]',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Resultado final: Lista ordenada',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '[3, 5, 6, 8]',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Botão para avançar
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  // Navega para BubbleSortIntroduction ao tocar
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BubbleSortSimulation(),
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
