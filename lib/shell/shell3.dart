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

class QuizScreenShell3 extends StatefulWidget {
  const QuizScreenShell3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenShell3State createState() => _QuizScreenShell3State();
}

class _QuizScreenShell3State extends State<QuizScreenShell3> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Qual é a função do primeiro laço `for (int gap = n / 2; gap > 0; gap /= 2)` no Shell Sort?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text': 'A) Controla o número de iterações no algoritmo',
          'isCorrect': false
        },
        {
          'text': 'B) Diminui progressivamente o valor do gap a cada iteração',
          'isCorrect': true
        },
        {
          'text': 'C) Realiza a troca dos elementos do vetor',
          'isCorrect': false
        },
        {
          'text': 'D) Inicializa o vetor com valores aleatórios',
          'isCorrect': false
        },
      ],
      'explanation':
          'O primeiro laço `for` no código controla o valor do `gap` (distância entre os elementos comparados), começando com metade do tamanho do vetor e diminuindo até chegar a 1.',
    },
    {
      'questionText':
          'Qual é a finalidade da linha `int temp = arr[i];` dentro do segundo laço `for`?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text':
              'A) Salvar o valor de `arr[i]` para comparar com os outros elementos',
          'isCorrect': false
        },
        {
          'text': 'B) Copiar o valor de `arr[i]` para realizar trocas',
          'isCorrect': true
        },
        {
          'text':
              'C) Armazenar temporariamente o valor de `arr[i]` para mover os elementos maiores',
          'isCorrect': false
        },
        {
          'text': 'D) Determinar o valor do gap em cada iteração',
          'isCorrect': false
        },
      ],
      'explanation':
          'A linha `int temp = arr[i];` armazena temporariamente o valor de `arr[i]` para que ele possa ser movido para a posição correta durante a execução do algoritmo.',
    },
    {
      'questionText':
          'O que acontece dentro do laço `while (j >= gap && arr[j - gap] > temp)` no código?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text':
              'A) Compara os valores do vetor e move os menores para a esquerda',
          'isCorrect': false
        },
        {
          'text':
              'B) Move os valores maiores para uma posição à frente e ajusta a posição de `arr[i]`',
          'isCorrect': true
        },
        {
          'text': 'C) Verifica se a sequência de valores está correta',
          'isCorrect': false
        },
        {
          'text': 'D) Realiza a troca entre os valores do vetor',
          'isCorrect': false
        },
      ],
      'explanation':
          'O laço `while` compara o valor atual `temp` com os elementos anteriores e move os elementos maiores para frente, criando espaço para inserir o valor correto de `temp` na posição adequada.',
    },
    {
      'questionText':
          'O que acontece ao final de cada iteração do laço `for (int i = gap; i < n; i++)`?',
      'image': 'assets/images/shell-cod.png',
      'answers': [
        {
          'text':
              'A) O valor `arr[i]` é inserido no seu local correto dentro do vetor',
          'isCorrect': true
        },
        {
          'text':
              'B) O valor de `gap` é diminuído para otimizar o tempo de execução',
          'isCorrect': false
        },
        {'text': 'C) O vetor é completamente ordenado', 'isCorrect': false},
        {
          'text': 'D) O vetor é dividido em subvetores menores',
          'isCorrect': false
        },
      ],
      'explanation':
          'Ao final de cada iteração do laço `for`, o valor `arr[i]` é inserido na posição correta, movendo os elementos maiores à frente e mantendo a ordem parcial do vetor.',
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
        if (contador < 4800) {
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
