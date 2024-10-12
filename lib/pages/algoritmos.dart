import 'package:flutter/material.dart';
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Ação ao clicar no ícone de notificações
            },
          ),
        ],
        title: const Text(
          'NOME APLICATIVO',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 14, // Define o tamanho da fonte do título
            fontWeight: FontWeight.normal, // Define o peso da fonte
          ),
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor: const Color.fromRGBO(250, 227, 105, 37),
        // backgroundColor: const Color.fromRGBO(250, 227, 105, 37),
        // Cor de fundo do AppBar
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'TIPOS DE ALGORITMOS DE ORDENAÇÃO MAIS COMUNS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'ALGORITMOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const Selectionsort()));
            },
            child: Container(
              height: 47,
              width: 390,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(
                      246, 224, 73, 1), // Cor da linha (borda)
                  width: 2.0, // Espessura da linha
                ),
              ),
              child: const Text('Selection Sort',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Bubblesort()));
            },
            child: Container(
              height: 47,
              width: 390,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(
                      246, 224, 73, 1), // Cor da linha (borda)
                  width: 2.0, // Espessura da linha
                ),
              ),
              child: const Text('Bubble Sort',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const Insertionsort()));
            },
            child: Container(
              height: 47,
              width: 390,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(
                      246, 224, 73, 1), // Cor da linha (borda)
                  width: 2.0, // Espessura da linha
                ),
              ),
              child: const Text('Insertion Sort',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Mergesort()));
            },
            child: Container(
              height: 47,
              width: 390,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(
                      246, 224, 73, 1), // Cor da linha (borda)
                  width: 2.0, // Espessura da linha
                ),
              ),
              child: const Text('Merge Sort',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Quicksort()));
            },
            child: Container(
              height: 47,
              width: 390,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(
                      246, 224, 73, 1), // Cor da linha (borda)
                  width: 2.0, // Espessura da linha
                ),
              ),
              child: const Text('Quick Sort',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
