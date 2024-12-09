import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/pratica.dart';



class BubbleSortSimulation extends StatefulWidget {
  const BubbleSortSimulation({super.key});

  @override
  _BubbleSortSimulationState createState() => _BubbleSortSimulationState();
}

class _BubbleSortSimulationState extends State<BubbleSortSimulation> {
  List<int> numbers = [4, 3, 2, 1]; // Lista inicial
  int currentIndex = 0; // Índice atual
  bool sorted = false; // Indicador se a lista está ordenada
  String explanation = ''; // Texto explicativo

  void compareAndSwap() {
    if (sorted) return; // Não faz nada se já estiver ordenado

    setState(() {
      // Verificar se ainda há pares para comparar
      if (currentIndex < numbers.length - 1) {
        if (numbers[currentIndex] > numbers[currentIndex + 1]) {
          // Trocar os elementos
          int temp = numbers[currentIndex];
          numbers[currentIndex] = numbers[currentIndex + 1];
          numbers[currentIndex + 1] = temp;

          explanation =
              'O número ${numbers[currentIndex]} é menor que ${numbers[currentIndex + 1]}. Troca realizada!';
        } else {
          explanation =
              'O número ${numbers[currentIndex]} já está no lugar correto em relação a ${numbers[currentIndex + 1]}.';
        }
        currentIndex++;
      } else {
        // Reiniciar o índice para a próxima passagem
        currentIndex = 0;

        // Verificar se está ordenado
        sorted = _isSorted();
        if (sorted) {
          explanation = 'A lista está completamente ordenada!';
        } else {
          explanation = 'Iniciando uma nova passagem para verificar trocas.';
        }
      }
    });
  }

  void reset() {
    setState(() {
      numbers = [4, 3, 2, 1]; // Reiniciar a lista
      currentIndex = 0;
      sorted = false;
      explanation = 'Clique em "Comparar e Trocar" para iniciar a simulação.';
    });
  }

  bool _isSorted() {
    for (int i = 0; i < numbers.length - 1; i++) {
      if (numbers[i] > numbers[i + 1]) return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    explanation = 'Clique em "Comparar e Trocar" para iniciar a simulação.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação: Bubble Sort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sorted ? 'A lista está ordenada! 🎉' : 'Comparando números...',
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
                    index == currentIndex || index == currentIndex + 1;

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
              height: 70, // Garantir que os botões tenham a mesma largura
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: sorted ? null : compareAndSwap,
                child: const Text('Comparar e Trocar'),
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
