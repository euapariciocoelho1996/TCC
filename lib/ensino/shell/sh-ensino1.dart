import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ensino/shell/sh-simula.dart';



class ShellSortIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que é Shell Sort?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                'O que é Shell Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Parágrafo inicial
              Text(
                'O Shell Sort é um algoritmo de ordenação baseado no método de inserção direta, '
                'mas com melhorias. Ele compara e troca elementos que estão a uma certa "distância" uns dos outros, '
                'diminuindo progressivamente essa distância até que a lista esteja completamente ordenada.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Subtítulo: O que é o Gap?
              Text(
                'O que é o Gap?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Explicação do Gap
              Text(
                'O gap é um parâmetro crucial no algoritmo Shell Sort. Ele representa a distância entre os elementos '
                'que serão comparados e, em seguida, trocados durante a ordenação. Em outras palavras, o gap determina '
                'os índices dos elementos a serem comparados em cada iteração do algoritmo.\n\n'
                'No início do algoritmo, o gap é geralmente grande, e ele vai diminuindo progressivamente até chegar a 1. '
                'Quando o gap chega a 1, o algoritmo se comporta como o Insertion Sort, ordenando a lista de forma tradicional.\n\n'
                'A escolha do gap afeta diretamente a eficiência do algoritmo. Gaps maiores ajudam a mover os elementos para '
                'as posições corretas mais rapidamente, enquanto gaps menores refinam a ordenação ao longo do processo.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Subtítulo: Como escolher o gap?
              Text(
                'Como escolher o gap?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Lista de estratégias para o gap
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint(
                      '1. Divisão por 2 (Método Clássico): O gap começa como N/2 e é reduzido pela metade até chegar a 1.'),
                  bulletPoint(
                      '2. Sequência de Knuth: Gaps seguem a fórmula: 3^k - 1 (ex.: 1, 4, 13, 40, ...).'),
                  bulletPoint(
                      '3. Sequência de Hibbard: Gaps seguem a fórmula: 2^k - 1 (ex.: 1, 3, 7, 15, ...).'),
                  bulletPoint(
                      '4. Sequência de Sedgewick: Usada para minimizar comparações em listas grandes.'),
                  bulletPoint(
                      '5. Outras sequências (ex.: Tokuda, Pratt): Usadas para problemas específicos.'),
                ],
              ),
              SizedBox(height: 20),

              // Subtítulo: Como funciona
              Text(
                'Como funciona o Shell Sort?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              Text(
                'O algoritmo começa dividindo a lista em sublistas com base no gap. '
                'Elementos dessas sublistas são comparados e trocados se necessário. '
                'O gap é reduzido a cada iteração até ser 1, quando o algoritmo se comporta como Insertion Sort.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

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
                      'Lista inicial: [45, 23, 78, 89]',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Passo 1: Inicializar o gap',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Gap inicial: 2 (metade do tamanho da lista).',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparação com gap = 2:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparar 45 e 78 (sem troca).',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparar 23 e 89 (sem troca).',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lista após gap 2: [45, 23, 78, 89]',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Passo 2: Reduzir o gap para 1',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Agora, usamos gap = 1, que é equivalente à ordenação por inserção direta.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparação com gap = 1:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparar 45 e 23 → Trocar → [23, 45, 78, 89]',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparar 45 e 78 (sem troca).',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Comparar 78 e 89 (sem troca).',
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
                      '[23, 45, 78, 89]',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Botão para simulação
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShellSortSimulation(),
                      ),
                    );
                  },
                  child: const Text('Simular Shell Sort'),
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
