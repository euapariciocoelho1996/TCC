import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/pratica.dart';



class ShellSortSimulation extends StatefulWidget {
  const ShellSortSimulation({super.key});

  @override
  _ShellSortSimulationState createState() => _ShellSortSimulationState();
}

class _ShellSortSimulationState extends State<ShellSortSimulation> {
  List<int> numbers = [8, 7, 4, 6, 2]; // Lista inicial
  int gap = 3; // Intervalo inicial (gap)
  int currentIndex = 0; // Índice atual
  bool sorted = false; // Indicador se a lista está ordenada
  String explanation = ''; // Texto explicativo

  void shellSortStep() {
    if (sorted) return; // Não faz nada se já estiver ordenado

    setState(() {
      if (gap > 0) {
        // Comparar elementos com o intervalo atual (gap)
        int compareIndex = currentIndex + gap;
        if (compareIndex < numbers.length) {
          if (numbers[currentIndex] > numbers[compareIndex]) {
            // Trocar os elementos
            int temp = numbers[currentIndex];
            numbers[currentIndex] = numbers[compareIndex];
            numbers[compareIndex] = temp;

            explanation =
                'O número ${numbers[compareIndex]} é maior que ${numbers[currentIndex]}. Troca realizada!';
          } else {
            explanation =
                'O número ${numbers[currentIndex]} já está na posição correta.';
          }
          currentIndex++;
        } else {
          // Resetar índice e diminuir o gap
          currentIndex = 0;
          gap = (gap ~/ 2); // Reduz o intervalo pela metade
          explanation = gap > 0
              ? 'Reduzindo o intervalo para $gap.'
              : 'Finalizando a ordenação...';
        }
      } else {
        // Verificar se está ordenado
        sorted = true;
        explanation = 'A lista está completamente ordenada!';
      }
    });
  }

  void reset() {
    setState(() {
      numbers = [8, 3, 7, 4, 6, 2]; // Reiniciar a lista
      gap = 3; // Reiniciar o gap
      currentIndex = 0;
      sorted = false;
      explanation = 'Clique em "Avançar Passo" para iniciar a simulação.';
    });
  }

  @override
  void initState() {
    super.initState();
    explanation = 'Clique em "Avançar Passo" para iniciar a simulação.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação: Shell Sort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sorted
                  ? 'A lista está ordenada! 🎉'
                  : 'Ordenando com intervalo $gap...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numbers.asMap().entries.map((entry) {
                int index = entry.key;
                int number = entry.value;

                // Destaque para os elementos sendo comparados
                bool isCurrent =
                    index == currentIndex || index == currentIndex + gap;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isCurrent ? Colors.orangeAccent : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Text(
              explanation,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Botões com a mesma largura
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: sorted ? null : shellSortStep,
                child: const Text('Avançar Passo'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Reiniciar',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreenSecundario()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Finalizar Estudos',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
