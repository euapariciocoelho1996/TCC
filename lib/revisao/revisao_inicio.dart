import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:projeto_tcc_flutter/pages/insertion.dart';
import 'package:projeto_tcc_flutter/pages/shell.dart';
import 'package:projeto_tcc_flutter/pages/quickSort.dart';
import 'package:projeto_tcc_flutter/revisao/funcoes.dart';
import 'package:projeto_tcc_flutter/revisao/if.dart';
import 'package:projeto_tcc_flutter/revisao/repeticao.dart';

class RevisaoInicio extends StatefulWidget {
  const RevisaoInicio({super.key});

  @override
  State<RevisaoInicio> createState() => _RevisaoInicioState();
}

class _RevisaoInicioState extends State<RevisaoInicio>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Começa fora da tela à direita
      end: Offset.zero, // Finaliza no centro
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Inicia a animação
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera os recursos do controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      'REVISÃO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Explore e compreenda como cada algoritmo funciona',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildTimelineItem(
                      number: '1',
                      title: 'IF/',
                      description: '',
                      backgroundColor: const Color.fromRGBO(125, 217, 194, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CodigoCAppIf()),
                        );
                      },
                    ),
                    _buildTimelineItem(
                      number: '2',
                      title: 'Laços de Repetição',
                      description: '',
                      backgroundColor: const Color.fromRGBO(255, 125, 151, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CodigoCAppRepeticao()),
                        );
                      },
                    ),
                    _buildTimelineItem(
                      number: '3',
                      title: 'Insertion Sort',
                      description: '',
                      backgroundColor: const Color.fromRGBO(255, 238, 128, 1),
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
                      title: 'Funções',
                      description: '',
                      backgroundColor: const Color.fromRGBO(128, 182, 255, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CodigoCAppFuncoes()),
                        );
                      },
                    ),
                    _buildTimelineItem(
                      number: '5',
                      title: 'Quick Sort',
                      description: '',
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
      ),
    );
  }

  Widget _buildTimelineItem({
    required String number,
    required String title,
    required String description,
    required VoidCallback onPressed,
    required Color backgroundColor,
  }) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
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
                    border: Border.all(color: backgroundColor, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: TextStyle(
                        color: backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (number !=
                    '5') // Linha conectando os números, exceto o último
                  Container(
                    width: 2,
                    height: 60,
                    color: backgroundColor,
                  ),
              ],
            ),
            const SizedBox(width: 16),
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
      ),
    );
  }
}
