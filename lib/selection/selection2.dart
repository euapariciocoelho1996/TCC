import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/GameOver.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/Vidas.dart';
import 'package:projeto_tcc_flutter/custom_button.dart';
import 'package:projeto_tcc_flutter/dialog_helper.dart';
import 'package:projeto_tcc_flutter/messages.dart';

import 'package:provider/provider.dart';


class QuizScreenSelection2 extends StatefulWidget {
  const QuizScreenSelection2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenSelection2State createState() => _QuizScreenSelection2State();
}

class _QuizScreenSelection2State extends State<QuizScreenSelection2> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Explique as linhas 5 e 6 (if (arr[j] < arr[minIndex]) minIndex = j;)',
      'image': 'assets/images/s-cod.png',
      'answers': [
        {
          'text':
              'A) Troca dois elementos adjacentes se estiverem fora de ordem',
          'isCorrect': false
        },
        {
          'text': 'B) Encontra o maior elemento na parte não ordenada do array',
          'isCorrect': false
        },
        {
          'text':
              'C) Localiza o menor elemento e atualiza seu índice para uma futura troca',
          'isCorrect': true
        },
        {
          'text':
              'D) Finaliza a ordenação quando todos os elementos estão no lugar certo',
          'isCorrect': false
        },
      ],
      'explanation':
          'As linhas 5 e 6 do código localizam o menor elemento na parte não ordenada do array e atualizam seu índice para uma futura troca. Isso garante que o menor elemento seja movido para sua posição correta no array ordenado.',
    },
    {
      'questionText':
          'O que acontece ao final de cada iteração do laço externo (for) na linha 2?',
      'image': 'assets/images/s-cod.png',
      'answers': [
        {
          'text': 'A) O maior elemento é movido para o final do array',
          'isCorrect': false
        },
        {
          'text': 'B) O menor elemento restante é colocado na posição correta',
          'isCorrect': true
        },
        {
          'text': 'C) A lista é dividida em duas metades ordenadas',
          'isCorrect': false
        },
        {
          'text': 'D) Todos os elementos são trocados entre si',
          'isCorrect': false
        },
      ],
      'explanation':
          'Ao final de cada iteração do laço externo, o menor elemento restante é colocado na posição correta. Isso gradualmente ordena o array à medida que o laço avança.',
    },
    {
      'questionText':
          'O que acontece se todos os elementos já estiverem ordenados no início?',
      'image': 'assets/images/s3.png',
      'answers': [
        {'text': 'A) O algoritmo para imediatamente', 'isCorrect': false},
        {
          'text': 'B) Ele faz as mesmas comparações, mas nenhuma troca',
          'isCorrect': true
        },
        {
          'text': 'C) Apenas metade das comparações são realizadas',
          'isCorrect': false
        },
        {'text': 'D) Impede a ordenação completa do array', 'isCorrect': false},
      ],
      'explanation':
          'Se todos os elementos já estiverem ordenados no início, o algoritmo faz as mesmas comparações, mas não realiza nenhuma troca. Isso ocorre porque cada comparação verifica se os elementos estão na ordem correta, mas como já estão ordenados, não há necessidade de trocas.',
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
        if (contador < 1500) {
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
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                VidaCoracoes(),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        /*decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bubble/bg7.png'), // Caminho da imagem
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
                  ),
                ),*/

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
      ),
    );
  }
}
