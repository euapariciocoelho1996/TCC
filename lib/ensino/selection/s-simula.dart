import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/main-secundario.dart';



class SelectionSortSimulation extends StatefulWidget {
  const SelectionSortSimulation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionSortSimulationState createState() =>
      _SelectionSortSimulationState();
}

class _SelectionSortSimulationState extends State<SelectionSortSimulation> {
  List<int> numbers = [7, 2, 5, 3]; // Lista inicial
  int currentIndex = 0; // Começa no primeiro elemento
  int minIndex = 0; // Índice do menor número encontrado
  bool sorted = false; // Indicador se a lista está ordenada
  String explanation = ''; // Texto explicativo

  void performStep() {
    if (sorted) return; // Não faz nada se já estiver ordenado

    setState(() {
      // Procura pelo menor elemento da lista não ordenada
      if (currentIndex < numbers.length - 1) {
        // Encontra o menor valor no restante da lista
        for (int i = currentIndex + 1; i < numbers.length; i++) {
          if (numbers[i] < numbers[minIndex]) {
            minIndex = i;
          }
        }

        // Troca o menor valor com o valor da posição atual
        if (minIndex != currentIndex) {
          int temp = numbers[currentIndex];
          numbers[currentIndex] = numbers[minIndex];
          numbers[minIndex] = temp;
          explanation = 'Trocamos ${numbers[minIndex]} com ${numbers[currentIndex]}';
        } else {
          explanation = 'O número ${numbers[currentIndex]} já está na posição correta.';
        }

        currentIndex++; // Avança para o próximo índice
      }

      // Verifica se está ordenado
      if (currentIndex >= numbers.length - 1) {
        sorted = true;
        explanation = 'A lista está completamente ordenada! 🎉';
      }
    });
  }

  void reset() {
    setState(() {
      numbers = [7, 2, 5, 3]; // Reinicia a lista
      currentIndex = 0; // Volta ao início do algoritmo
      minIndex = 0;
      sorted = false;
      explanation = 'Clique em "Próximo Passo" para começar a simulação.';
    });
  }

  @override
  void initState() {
    super.initState();
    explanation = 'Clique em "Próximo Passo" para começar a simulação.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação: Selection Sort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sorted
                  ? 'A lista está ordenada! 🎉'
                  : 'Procurando o menor número na parte não ordenada...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numbers.asMap().entries.map((entry) {
                int index = entry.key;
                int number = entry.value;

                // Destaque para os elementos sendo comparados
                bool isCurrent = index == currentIndex || index == minIndex;

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
            const SizedBox(height: 20),
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
                onPressed: sorted ? null : performStep,
                child: const Text('Próximo Passo'),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
