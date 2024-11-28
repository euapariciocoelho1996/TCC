import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/main-secundario.dart';



class QuickSortSimulation extends StatefulWidget {
  const QuickSortSimulation({super.key});

  @override
  _QuickSortSimulationState createState() => _QuickSortSimulationState();
}

class _QuickSortSimulationState extends State<QuickSortSimulation> {
  List<int> numbers = [7, 2, 5, 3, 8, 1, 9, 4, 6, 10]; // Lista maior de números
  bool sorted = false; // Indicador se a lista está ordenada
  String explanation = ''; // Texto explicativo
  List<Color> colors = [
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent
  ]; // Cores iniciais

  // Função de partição do QuickSort
  int partition(List<int> arr, int low, int high) {
    int pivot = arr[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (arr[j] < pivot) {
        i++;
        // Troca arr[i] e arr[j]
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
    // Troca arr[i + 1] e arr[high] (pivot)
    int temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;
    return i + 1;
  }

  // Função recursiva do QuickSort
  void quickSort(List<int> arr, int low, int high) {
    if (low < high) {
      int pi = partition(arr, low, high);

      // Atualiza as cores para destacar os elementos
      List<Color> updatedColors = List.generate(arr.length, (index) {
        if (index == low || index == high) {
          return Colors.orangeAccent; // Destaque os índices low e high
        } else if (index == pi) {
          return Colors.greenAccent; // Destaque para o pivot
        } else {
          return Colors.blueAccent;
        }
      });

      setState(() {
        colors = updatedColors;
      });

      // Animação de transição, aguarda um tempo para continuar
      Future.delayed(const Duration(milliseconds: 500), () {
        // Ordena recursivamente as duas partes
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
      });
    }
  }

  // Função para iniciar a simulação
  void performStep() {
    if (sorted) return;

    setState(() {
      quickSort(numbers, 0, numbers.length - 1);
      sorted = true;
      explanation = 'A lista foi ordenada usando o QuickSort! 🎉';
    });
  }

  // Função para reiniciar a simulação
  void reset() {
    setState(() {
      numbers = [7, 2, 5, 3, 8, 1, 9, 4, 6, 10]; // Reinicia a lista
      colors = List.generate(
          numbers.length, (index) => Colors.blueAccent); // Reseta as cores
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
        title: const Text('Simulação: QuickSort'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sorted ? 'A lista está ordenada! 🎉' : 'Executando QuickSort...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numbers.asMap().entries.map((entry) {
                int index = entry.key;
                int number = entry.value;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colors[index], // Usando cores dinâmicas
                    borderRadius: BorderRadius.circular(5),
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
              height: 70,
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
