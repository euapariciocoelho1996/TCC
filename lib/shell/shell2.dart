import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/GameOver.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/Vidas.dart';
import 'package:projeto_tcc_flutter/custom_button.dart';
import 'package:projeto_tcc_flutter/dialog_helper.dart';
import 'package:projeto_tcc_flutter/fundo.dart';
import 'package:projeto_tcc_flutter/messages.dart';

import 'package:provider/provider.dart';


class QuizScreenShell2 extends StatefulWidget {
  const QuizScreenShell2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenShell2State createState() => _QuizScreenShell2State();
}

class _QuizScreenShell2State extends State<QuizScreenShell2> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'O que a variável `gap` controla no algoritmo Shell Sort?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text': 'A) A quantidade de elementos a serem comparados de uma vez',
          'isCorrect': false
        },
        {
          'text': 'B) A distância entre os elementos a serem comparados',
          'isCorrect': true
        },
        {'text': 'C) O número de iterações do algoritmo', 'isCorrect': false},
        {
          'text': 'D) O valor máximo do vetor a ser ordenado',
          'isCorrect': false
        },
      ],
      'explanation':
          'No Shell Sort, a variável `gap` controla a distância entre os elementos que serão comparados, e essa distância diminui progressivamente durante o processo de ordenação.',
    },
    {
      'questionText':
          'Qual é o propósito do laço `while (j >= gap && arr[j - gap] > temp)` no código?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text':
              'A) Mover o valor de `arr[i]` para a posição correta no vetor',
          'isCorrect': false
        },
        {
          'text':
              'B) Garantir que o valor `arr[i]` seja movido para a primeira posição',
          'isCorrect': false
        },
        {
          'text':
              'C) Comparar os elementos e mover os maiores valores uma posição à frente',
          'isCorrect': true
        },
        {
          'text':
              'D) Verificar se o valor `arr[i]` é maior que todos os valores anteriores',
          'isCorrect': false
        },
      ],
      'explanation':
          'O laço `while` serve para comparar o valor atual com os elementos anteriores e mover os maiores valores uma posição à frente, garantindo a ordenação.',
    },
    {
      'questionText':
          'Qual é o comportamento do algoritmo quando o valor de `gap` se torna igual a 1?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text': 'A) O algoritmo termina e o vetor já está ordenado',
          'isCorrect': true
        },
        {
          'text':
              'B) O algoritmo começa a realizar comparações com o último valor do vetor',
          'isCorrect': false
        },
        {
          'text': 'C) O algoritmo repete as comparações com o valor inicial',
          'isCorrect': false
        },
        {
          'text': 'D) O algoritmo reinicia com um novo valor de `gap`',
          'isCorrect': false
        },
      ],
      'explanation':
          'Quando `gap` se torna igual a 1, o algoritmo realiza a última fase da ordenação e o vetor é completamente ordenado.',
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

        showCorrectAnswerDialog(
            context, correctAnswer, explanation, _confettiController);

        final contador = Provider.of<Counter>(context, listen: false).count;
        if (contador < 4400) {
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
