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

class QuizScreenSelection3 extends StatefulWidget {
  const QuizScreenSelection3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenSelection3State createState() => _QuizScreenSelection3State();
}

class _QuizScreenSelection3State extends State<QuizScreenSelection3> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'O que diferencia o melhor e o pior caso no Selection Sort?',
      'image': 'assets/images/s2.png',
      'answers': [
        {'text': 'A) O número de trocas realizadas', 'isCorrect': false},
        {
          'text': 'B) A lista inicial estar parcialmente ordenada',
          'isCorrect': false
        },
        {
          'text':
              'C) Nada, o algoritmo faz as mesmas comparações em qualquer caso',
          'isCorrect': true
        },
        {'text': 'D) O tamanho do array', 'isCorrect': false},
      ],
      'explanation':
          'O Selection Sort faz as mesmas comparações em qualquer caso, independentemente da ordem inicial dos elementos. Isso resulta no mesmo número de comparações tanto no melhor quanto no pior caso.',
    },
    {
      'questionText':
          'Por que o caso médio do Selection Sort é considerado ineficiente?',
      'image': 'assets/images/s1.png',
      'answers': [
        {
          'text': 'A) Ele faz apenas algumas comparações extras',
          'isCorrect': false
        },
        {
          'text': 'B) Ele não aproveita listas parcialmente ordenadas',
          'isCorrect': true
        },
        {
          'text': 'C) Ele só funciona bem com listas pequenas',
          'isCorrect': false
        },
        {'text': 'D) Ele depende do tipo dos elementos', 'isCorrect': false},
      ],
      'explanation':
          'O caso médio do Selection Sort é considerado ineficiente porque ele não aproveita listas que já estão parcialmente ordenadas. O algoritmo sempre percorre a lista completa para encontrar o menor elemento, independentemente da ordem inicial.',
    },
    {
      'questionText':
          'Qual cenário não traz nenhuma vantagem para o Selection Sort?',
      'image': 'assets/images/s3.png',
      'answers': [
        {'text': 'A) Lista já ordenada', 'isCorrect': false},
        {'text': 'B) Lista com todos os elementos iguais', 'isCorrect': false},
        {'text': 'C) Lista totalmente invertida', 'isCorrect': false},
        {'text': 'D) Todos os anteriores', 'isCorrect': true},
      ],
      'explanation':
          'Nenhum desses cenários traz vantagem para o Selection Sort. O algoritmo realiza a mesma quantidade de comparações independentemente da ordem inicial dos elementos, o que significa que não se beneficia de listas já ordenadas, com elementos iguais, ou totalmente invertidas.',
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

        //showCorrectAnswerDialog(
            //context, correctAnswer, explanation, _confettiController);

        final contador = Provider.of<Counter>(context, listen: false).count;
        if (contador < 1800) {
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
