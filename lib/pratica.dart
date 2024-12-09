import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/bubble/NivelTimelineBubble.dart';
import 'package:projeto_tcc_flutter/bubble/estrelas.dart';
import 'package:projeto_tcc_flutter/fundo.dart';
import 'package:projeto_tcc_flutter/insertion/NivelTimelineInsertion.dart';
import 'package:projeto_tcc_flutter/insertion/estrelas.dart';
import 'package:projeto_tcc_flutter/quick/NivelTimelineQuick.dart';
import 'package:projeto_tcc_flutter/quick/estrelas.dart';
import 'package:projeto_tcc_flutter/selection/NivelTimelineSelection.dart';
import 'package:projeto_tcc_flutter/selection/estrelas.dart';
import 'package:projeto_tcc_flutter/shell/NivelTimelineShell.dart';
import 'package:projeto_tcc_flutter/shell/estrelas.dart';
import 'package:provider/provider.dart';

class HomeScreenSecundario extends StatefulWidget {
  const HomeScreenSecundario({super.key});

  @override
  State<HomeScreenSecundario> createState() => _HomeScreenSecundarioState();
}

class _HomeScreenSecundarioState extends State<HomeScreenSecundario>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Começa fora da tela (abaixo)
      end: Offset.zero, // Finaliza na posição original
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
      position: _slideAnimation,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          children: [
            CustomBackground(),
            
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const Text(
                    'Níveis Disponíveis',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const CounterDisplay(),
                const SizedBox(height: 30),
                StarRatingB(),
                const SizedBox(height: 30),
                const BubbleN(),
                const SizedBox(height: 50),
                StarRatingS(),
                const SizedBox(height: 30),
                const SelectionN(),
                const SizedBox(height: 50),
                StarRatingI(),
                const SizedBox(height: 30),
                const InsertionN(),
                const SizedBox(height: 50),
                StarRatingQ(),
                const SizedBox(height: 30),
                const QuickN(),
                const SizedBox(height: 50),
                StarRatingSh(),
                const SizedBox(height: 30),
                const ShellN(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) {
        return Center(
          child: Text(
            'Pontuação atual: ${counter.count}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
