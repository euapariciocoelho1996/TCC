import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/GameOver.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/Vidas.dart';
import 'package:projeto_tcc_flutter/custom_button.dart';

import 'package:projeto_tcc_flutter/fundo.dart';
import 'package:projeto_tcc_flutter/messages.dart';

import 'package:provider/provider.dart';


class QuizScreenShell1 extends StatefulWidget {
  const QuizScreenShell1({super.key});

  @override
  _QuizScreenShell1State createState() => _QuizScreenShell1State();
}

class _QuizScreenShell1State extends State<QuizScreenShell1> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText': 'Qual é a principal característica do algoritmo Shell Sort?',
      'image': 'assets/images/sh1.png',
      'answers': [
        {'text': 'A) Utiliza comparação direta de elementos adjacentes', 'isCorrect': false},
        {'text': 'B) Realiza trocas de elementos em posições distantes inicialmente', 'isCorrect': true},
        {'text': 'C) Sempre divide a lista ao meio', 'isCorrect': false},
        {'text': 'D) Utiliza a técnica de ordenação por seleção', 'isCorrect': false},
      ],
      'explanation':
          'A principal característica do Shell Sort é que ele faz comparações e trocas de elementos distantes e, progressivamente, diminui a distância entre os elementos a serem comparados, melhorando a eficiência em comparação com a ordenação por inserção direta.',
    },
    // Outras perguntas...
  ];

  int _currentQuestionIndex = 0;
  bool? _isAnswerCorrect;
  String? _feedbackMessage;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _isAnswerCorrect = isCorrect;
      _feedbackMessage = isCorrect
          ? Messages.correctMessages[Random().nextInt(Messages.correctMessages.length)]
          : Messages.errorMessages[Random().nextInt(Messages.errorMessages.length)];

      if (!isCorrect) {
        final vidas = Provider.of<Counter>(context, listen: false);
        if (vidas.vidas == 1) {
          vidas.perderVida();
          Gameover.mostrarGameOver(context);
        } else {
          vidas.perderVida();
        }
      }

      if (isCorrect) {
        final currentQuestion = _perguntas[_currentQuestionIndex];
        final correctAnswer = (currentQuestion['answers'] as List<Map<String, Object>>)
            .firstWhere((answer) => answer['isCorrect'] == true)['text'] as String;
        final explanation = currentQuestion['explanation'] as String;

        //showCorrectAnswerDialog(context, correctAnswer, explanation, _confettiController);

        final contador = Provider.of<Counter>(context, listen: false).count;
        if (contador < 4100) {
          Provider.of<Counter>(context, listen: false).increment();
        }
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex + 1 < _perguntas.length) {
        _currentQuestionIndex++;
      } else {
        Navigator.pop(context);
      }
      _isAnswerCorrect = null;
      _feedbackMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _perguntas[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz em Flutter'),
      ),
      body: Stack(
        children: [
          CustomBackground(),
          ListView(
            children: [
              Column(
                children: [
                  VidaCoracoes(),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // **Texto sobre a imagem**
                            Stack(
                              children: [
                                Image.asset(
                                  currentQuestion['image'] as String,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      currentQuestion['questionText'] as String,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4.0,
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            ...(currentQuestion['answers'] as List<Map<String, Object>>).map(
                              (answer) {
                                Color buttonColor;
                                if (_isAnswerCorrect == null) {
                                  buttonColor = Colors.blue;
                                } else if (answer['isCorrect'] == _isAnswerCorrect) {
                                  buttonColor = _isAnswerCorrect! ? Colors.green : Colors.red;
                                } else {
                                  buttonColor = Colors.blue;
                                }
          
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: CustomButton(
                                    text: answer['text'] as String,
                                    color: buttonColor,
                                    onPressed: _isAnswerCorrect == null
                                        ? () => _checkAnswer(answer['isCorrect'] as bool)
                                        : null,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            if (_feedbackMessage != null)
                              Text(
                                _feedbackMessage!,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _isAnswerCorrect! ? Colors.green : Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            const SizedBox(height: 16),
                            if (_isAnswerCorrect != null)
                              CustomButton(
                                text: _isAnswerCorrect! ? 'Próxima pergunta' : 'Tente novamente',
                                color: _isAnswerCorrect! ? Colors.blue : Colors.red,
                                onPressed: _isAnswerCorrect!
                                    ? _nextQuestion
                                    : () {
                                        setState(() {
                                          _isAnswerCorrect = null;
                                          _feedbackMessage = null;
                                        });
                                      },
                              ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: ConfettiWidget(
                          confettiController: _confettiController,
                          blastDirection: pi / 2,
                          emissionFrequency: 0.05,
                          numberOfParticles: 25,
                          maxBlastForce: 20,
                          minBlastForce: 10,
                          gravity: 0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
