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

class QuizScreenInsertion3 extends StatefulWidget {
  const QuizScreenInsertion3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenInsertion3State createState() => _QuizScreenInsertion3State();
}

class _QuizScreenInsertion3State extends State<QuizScreenInsertion3> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Qual é a complexidade de tempo do Insertion Sort no melhor caso?',
      'image': 'assets/images/i2.png',
      'answers': [
        {'text': 'A) O(n)', 'isCorrect': true},
        {'text': 'B) O(n log n)', 'isCorrect': false},
        {'text': 'C) O(n²)', 'isCorrect': false},
        {'text': 'D) Nenhuma das alternativas', 'isCorrect': false},
      ],
      'explanation':
          'No melhor caso, quando a lista já está ordenada, o Insertion Sort realiza apenas n-1 comparações e nenhuma troca, resultando em uma complexidade de O(n).',
    },
    {
      'questionText':
          'Qual é a complexidade de tempo do Insertion Sort no pior caso?',
      'image': 'assets/images/i3.png',
      'answers': [
        {'text': 'A) O(n)', 'isCorrect': false},
        {'text': 'B) O(n log n)', 'isCorrect': false},
        {'text': 'C) O(n²)', 'isCorrect': true},
        {'text': 'D) Nenhuma das alternativas', 'isCorrect': false},
      ],
      'explanation':
          'No pior caso, quando a lista está em ordem reversa, o Insertion Sort precisa realizar n²/2 comparações e n²/2 trocas, resultando em uma complexidade de O(n²).',
    },
    {
      'questionText':
          'Qual é a complexidade de tempo do Insertion Sort no caso médio?',
      'image': 'assets/images/i1.png',
      'answers': [
        {'text': 'A) O(n)', 'isCorrect': false},
        {'text': 'B) O(n log n)', 'isCorrect': false},
        {'text': 'C) O(n²)', 'isCorrect': true},
        {'text': 'D) Nenhuma das alternativas', 'isCorrect': false},
      ],
      'explanation':
          'No caso médio, o Insertion Sort também apresenta uma complexidade de O(n²), pois o número de comparações e trocas varia linearmente em relação à desordem dos elementos.',
    },
    {
      'questionText': 'Quando o Insertion Sort é mais eficiente?',
      'image': 'assets/images/i2.png',
      'answers': [
        {
          'text': 'A) Quando a lista está em ordem aleatória',
          'isCorrect': false
        },
        {'text': 'B) Quando a lista já está ordenada', 'isCorrect': true},
        {'text': 'C) Quando a lista está em ordem reversa', 'isCorrect': false},
        {
          'text': 'D) Quando a lista tem muitos elementos duplicados',
          'isCorrect': false
        },
      ],
      'explanation':
          'O Insertion Sort é mais eficiente quando a lista já está ordenada ou quase ordenada, pois realiza poucas comparações e nenhuma ou poucas trocas.',
    },
  ];

  int _currentQuestionIndex = 0;
  bool? _isAnswerCorrect;
  String? _feedbackMessage;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
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
          ? Messages.correctMessages[
              Random().nextInt(Messages.correctMessages.length)]
          : Messages
              .errorMessages[Random().nextInt(Messages.errorMessages.length)];

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
        // Obtém a resposta correta e a explicação da pergunta
        final currentQuestion = _perguntas[_currentQuestionIndex];
        final correctAnswer =
            (currentQuestion['answers'] as List<Map<String, Object>>)
                    .firstWhere((answer) => answer['isCorrect'] == true)['text']
                as String;
        final explanation = currentQuestion['explanation'] as String;

        // showCorrectAnswerDialog(
         //   context, correctAnswer, explanation, _confettiController);

        final contador = Provider.of<Counter>(context, listen: false).count;
        if (contador < 2900) {
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
        title: Text('Quiz em Flutter'),
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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              currentQuestion['questionText'] as String,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Image.asset(
                              currentQuestion['image'] as String,
                              height: 230,
                              fit: BoxFit
                                  .fill, // Use BoxFit.fill para preencher o espaço ou BoxFit.contain para manter a proporção
                            ),
                            const SizedBox(height: 24),
                            ...(currentQuestion['answers']
                                    as List<Map<String, Object>>)
                                .map(
                              (answer) {
                                Color buttonColor;
                                if (_isAnswerCorrect == null) {
                                  buttonColor = Colors.blue;
                                } else if (answer['isCorrect'] ==
                                    _isAnswerCorrect) {
                                  buttonColor = _isAnswerCorrect!
                                      ? Colors.green
                                      : Colors.red;
                                } else {
                                  buttonColor = Colors.blue;
                                }

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: CustomButton(
                                    text: answer['text'] as String,
                                    color: buttonColor,
                                    onPressed: _isAnswerCorrect == null
                                        ? () => _checkAnswer(
                                            answer['isCorrect'] as bool)
                                        : null,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            if (_feedbackMessage != null)
                              Text(
                                _feedbackMessage!,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _isAnswerCorrect!
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            SizedBox(height: 16),
                            if (_isAnswerCorrect != null)
                              CustomButton(
                                text: _isAnswerCorrect!
                                    ? 'Próxima pergunta'
                                    : 'Tente novamente',
                                color: _isAnswerCorrect!
                                    ? Colors.blue
                                    : Colors.red,
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
