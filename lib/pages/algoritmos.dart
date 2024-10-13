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
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(149, 250, 226, 105),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(145, 158, 158, 158),
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                height: 70,
                width: 390,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'TIPOS DE ALGORITMOS DE ORDENAÇÃO',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Column(
                  children: [
                    // Conteúdo do container
                    const SizedBox(height: 15),
                    const Text(
                      'ALGORITMOS',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 150,
                      height: 2, // Espessura da linha
                      color: const Color.fromARGB(255, 0, 0, 0), // Cor da linha
                    ),
                    // Linha de baixo
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                      height: 107,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              4.0,
                              4.0,
                            ),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('Selection Sort',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Ação quando o Container é pressionado
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Bubblesort()));
                    },
                    child: Container(
                      height: 107,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              4.0,
                              4.0,
                            ),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('Bubble Sort',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                      height: 107,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              4.0,
                              4.0,
                            ),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('Insertion Sort',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Ação quando o Container é pressionado
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Mergesort()));
                    },
                    child: Container(
                      height: 107,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              4.0,
                              4.0,
                            ),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('Merge Sort',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Ação quando o Container é pressionado
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Quicksort()));
                },
                child: Container(
                  height: 107,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(250, 227, 105, 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          4.0,
                          4.0,
                        ),
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text('Quick Sort',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  'ATENÇÃO',
                  style: TextStyle(
                    color: Color.fromRGBO(237, 133, 59, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 480,
                height: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: const Text(
                    'Existem diversos outros tipos de algoritmos de ordenação que não estão incluídos neste aplicativo.'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
