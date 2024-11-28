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


class QuizScreenQuick3 extends StatefulWidget {
  const QuizScreenQuick3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenQuick3State createState() => _QuizScreenQuick3State();
}

class _QuizScreenQuick3State extends State<QuizScreenQuick3> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Qual é a complexidade de tempo do QuickSort no melhor caso?',
      'image': 'assets/bubble/pt2.png',
      'answers': [
        {'text': 'A) O(n)', 'isCorrect': false},
        {'text': 'B) O(nlogn)', 'isCorrect': true},
        {'text': 'C) O', 'isCorrect': false},
        {'text': 'D) Nenhuma das alternativas', 'isCorrect': false},
      ],
      'explanation':
          'No melhor caso, o QuickSort divide o array de forma balanceada, resultando em uma complexidade de tempo de O(n log n).',
    },
    {
      'questionText':
          'Qual técnica pode ser usada para evitar o pior caso de O(n²) no QuickSort?',
      'image': 'assets/bubble/pt2.png',
      'answers': [
        {
          'text': 'A) Escolher sempre o primeiro elemento como pivô',
          'isCorrect': false
        },
        {
          'text': 'B) Escolher sempre o último elemento como pivô',
          'isCorrect': false
        },
        {
          'text':
              'C) Selecionar o pivô aleatoriamente ou pela "mediana de três"',
          'isCorrect': true
        },
        {
          'text': 'D) Parar a execução ao encontrar um pivô maior que a média',
          'isCorrect': false
        },
      ],
      'explanation':
          'Escolher o pivô aleatoriamente ou usar a estratégia da "mediana de três" ajuda a evitar o particionamento desbalanceado, reduzindo a chance do pior caso.',
    },
    {
      'questionText':
          'Por que o QuickSort é mais eficiente que o Selection Sort na maioria dos casos?',
      'image': 'assets/bubble/pt2.png',
      'answers': [
        {
          'text': 'A) Porque o QuickSort não usa chamadas recursivas',
          'isCorrect': false
        },
        {
          'text':
              'B) QuickSort usa a divisão e conquista, com complexidade média de O(n log n), já o Selection Sort é O(n²) mesmo no caso médio',
          'isCorrect': true,
        },
        {
          'text':
              'C) Porque o QuickSort ordena o array de uma vez sem particionar',
          'isCorrect': false,
        },
        {
          'text': 'D) Porque o QuickSort seleciona o maior elemento como pivô',
          'isCorrect': false
        },
      ],
      'explanation':
          'O QuickSort é mais eficiente porque utiliza a estratégia de "dividir e conquistar", alcançando uma complexidade média de O(n log n), enquanto o Selection Sort permanece O(n²) em todos os casos.',
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
        if (contador < 3800) {
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
                              color:
                                  _isAnswerCorrect! ? Colors.blue : Colors.red,
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
      ),
    );
  }
}
