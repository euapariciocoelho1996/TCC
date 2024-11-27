import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:projeto_tcc_flutter/pages/insertion.dart';
import 'package:projeto_tcc_flutter/pages/mergeSort.dart';
import 'package:projeto_tcc_flutter/pages/quickSort.dart';
import './selectionSort.dart';
import './bubbleSort.dart';

class Algoritmos extends StatelessWidget {
  const Algoritmos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 31, 31),
      appBar: customAppBar('Nome Aplicativo'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.png"), // Caminho da imagem
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho da tela
          ),
        ),
        child: ListView(
          children: [
            // Header with title and line
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'ALGORITMOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 150,
                    height: 2, // Espessura da linha
                    color: const Color.fromARGB(255, 0, 0, 0), // Cor da linha
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // List of algorithms (Timeline)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildTimelineItem(
                    number: '1',
                    title: 'Selection Sort',
                    description: '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Selectionsort()),
                      );
                    },
                  ),
                  _buildTimelineItem(
                    number: '2',
                    title: 'Bubble Sort',
                    description: '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bubblesort()),
                      );
                    },
                  ),
                  _buildTimelineItem(
                    number: '3',
                    title: 'Insertion Sort',
                    description: '.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Insertionsort()),
                      );
                    },
                  ),
                  _buildTimelineItem(
                    number: '4',
                    title: 'Merge Sort',
                    description: '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mergesort()),
                      );
                    },
                  ),
                  _buildTimelineItem(
                    number: '5',
                    title: 'Quick Sort',
                    description: '',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Quicksort()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }

  Widget _buildTimelineItem({
    required String number,
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              if (number != '5') // Linha conectando os números, exceto o último
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.orange,
                ),
            ],
          ),
          const SizedBox(width: 16), // Espaço entre o número e o texto
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
