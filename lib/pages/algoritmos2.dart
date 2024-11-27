import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/pages/bubbleSort.dart';
import 'package:projeto_tcc_flutter/pages/insertion.dart';
import 'package:projeto_tcc_flutter/pages/shell.dart';
import 'package:projeto_tcc_flutter/pages/quickSort.dart';
import 'package:projeto_tcc_flutter/pages/selectionSort.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          _buildTimelineItem(
            context: context,
            number: '1',
            title: 'Bubble Sort',
            description: '',
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Bubblesort()));
            },
          ),
          _buildTimelineItem(
            context: context,
            number: '2',
            title: 'Selection Sort',
            description: '',
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const Selectionsort()));
            },
          ),
          _buildTimelineItem(
            context: context,
            number: '3',
            title: 'Insertion Sort',
            description: '',
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const Insertionsort()));
            },
          ),
          _buildTimelineItem(
            context: context,
            number: '4',
            title: 'QuickSort',
            description: '',
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Quicksort()));
            },
          ),
          _buildTimelineItem(
            context: context,
            number: '5',
            title: 'Shell Sort',
            description: '',
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Shellsort()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required String number,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Número dentro de um círculo
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (number != '6') // Linha conectando os números, exceto o último
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.orange,
                ),
            ],
          ),
          const SizedBox(width: 16), // Espaço entre o número e o texto
          // Título e descrição
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
