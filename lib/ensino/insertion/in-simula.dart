import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/main-secundario.dart';



class InsertionSortSimulation extends StatefulWidget {
  const InsertionSortSimulation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InsertionSortSimulationState createState() =>
      _InsertionSortSimulationState();
}

class _InsertionSortSimulationState extends State<InsertionSortSimulation> {
  List<int> numbers = [7, 2, 5, 3]; // Lista inicial
  int currentIndex = 1; // Começa no segundo elemento (índice 1)
  int innerIndex = 0; // Índice para comparações internas
  bool sorted = false; // Indicador se a lista está ordenada
  String explanation = ''; // Texto explicativo

  void performStep() {
    if (sorted) return; // Não faz nada se já estiver ordenado

    setState(() {
      if (innerIndex >= 0 && numbers[innerIndex] > numbers[innerIndex + 1]) {
        // Troca os elementos, se necessário
        int temp = numbers[innerIndex];
        numbers[innerIndex] = numbers[innerIndex + 1];
        numbers[innerIndex + 1] = temp;
        explanation =
            'O número ${numbers[innerIndex + 1]} é maior que ${numbers[innerIndex]}, então trocamos suas posições.';
        innerIndex--; // Continua comparando com os elementos anteriores
      } else {
        // Avança para o próximo elemento
        explanation =
            'O número ${numbers[innerIndex + 1]} está na posição correta.';
        currentIndex++;
        innerIndex = currentIndex - 1;

        // Verifica se está ordenado
        if (currentIndex >= numbers.length) {
          sorted = true;
          explanation = 'A lista está completamente ordenada!';
        }
      }
    });
  }

  void reset() {
    setState(() {
      numbers = [7, 2, 5, 3]; // Reinicia a lista
      currentIndex = 1; // Volta ao início do algoritmo
      innerIndex = 0;
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
        title: const Text('Simulação: Insertion Sort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sorted
                  ? 'A lista está ordenada! 🎉'
                  : 'Inserindo número na posição correta...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numbers.asMap().entries.map((entry) {
                int index = entry.key;
                int number = entry.value;

                // Destaque para os elementos sendo comparados
                bool isCurrent = index == currentIndex || index == innerIndex;

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
