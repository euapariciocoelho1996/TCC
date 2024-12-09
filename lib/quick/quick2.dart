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

class QuizScreenQuick2 extends StatefulWidget {
  const QuizScreenQuick2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenQuick2State createState() => _QuizScreenQuick2State();
}

class _QuizScreenQuick2State extends State<QuizScreenQuick2> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText': 'O que o operador * faz em *a e *b?',
      'image': 'assets/images/pt1.png',
      'answers': [
        {'text': 'A) Multiplica os valores de a e b', 'isCorrect': false},
        {'text': 'B) Substitui o valor de a por b', 'isCorrect': false},
        {
          'text':
              'C) Acessa o valor armazenado no endereço apontado por a ou b',
          'isCorrect': true,
        },
        {
          'text': 'D) Altera os ponteiros a e b para novos endereços',
          'isCorrect': false,
        },
      ],
      'explanation':
          'O operador * em ponteiros é utilizado para acessar o valor armazenado no endereço de memória ao qual o ponteiro aponta.',
    },
    {
      'questionText':
          'Qual é o papel da condição if (arr[j] <= pivo) dentro do for?',
      'image': 'assets/images/pt1-1.png',
      'answers': [
        {
          'text': 'A) Verificar se o valor atual de arr[j] é maior que o pivô',
          'isCorrect': false,
        },
        {
          'text':
              'B) Comparar o valor arr[j] com o pivô para saber se ele é menor ou igual ao pivô',
          'isCorrect': true,
        },
        {
          'text': 'C) Trocar automaticamente o valor de arr[j] com o pivô',
          'isCorrect': false,
        },
        {'text': 'D) Trocar o pivô de posição', 'isCorrect': false},
      ],
      'explanation':
          'A condição if (arr[j] <= pivo) é usada para verificar quais elementos estão na partição correta, ou seja, menores ou iguais ao pivô.',
    },
    {
      'questionText':
          'Qual é o objetivo das chamadas quicksort(arr, inicio, pi - 1); e quicksort(arr, pi + 1, alto);?',
      'image': 'assets/images/pt2.png',
      'answers': [
        {
          'text': 'A) Ordenar apenas a parte esquerda do arr',
          'isCorrect': false
        },
        {
          'text':
              'B) Dividir o vetor em duas partes e ordenar ambas recursivamente',
          'isCorrect': true,
        },
        {'text': 'C) Ordenar todo o arr de uma só vez', 'isCorrect': false},
        {'text': 'D) Aumentar o valor do pivô', 'isCorrect': false},
      ],
      'explanation':
          'Essas chamadas recursivas dividem o vetor em duas partições (esquerda e direita em relação ao pivô) e ordenam cada uma delas.',
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
        if (contador < 3500) {
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
