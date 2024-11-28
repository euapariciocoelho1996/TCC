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


class QuizScreenQuick1 extends StatefulWidget {
  const QuizScreenQuick1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenQuick1State createState() => _QuizScreenQuick1State();
}

class _QuizScreenQuick1State extends State<QuizScreenQuick1> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Qual é o elemento escolhido para dividir a lista no Quicksort?',
      'image': 'assets/images/q1.png',
      'answers': [
        {'text': 'A) Mediana da lista', 'isCorrect': false},
        {'text': 'B) Menor elemento da lista', 'isCorrect': false},
        {'text': 'C) Pivô', 'isCorrect': true},
        {'text': 'D) Maior elemento da lista', 'isCorrect': false},
      ],
      'explanation':
          'O Quicksort utiliza o pivô como elemento escolhido para dividir a lista em duas partes: uma com elementos menores e outra com elementos maiores que o pivô.',
    },
    {
      'questionText': 'Qual é a principal estratégia usada pelo Quicksort?',
      'image': 'assets/images/q2.png',
      'answers': [
        {'text': 'A) Dividir e conquistar', 'isCorrect': true},
        {'text': 'B) Programação dinâmica', 'isCorrect': false},
        {'text': 'C) Backtracking', 'isCorrect': false},
        {'text': 'D) Recursão linear', 'isCorrect': false},
      ],
      'explanation':
          'O Quicksort é baseado na estratégia de "Dividir e Conquistar", onde o problema é dividido em subproblemas menores que são resolvidos recursivamente.',
    },
    {
      'questionText': 'Qual das alternativas é uma vantagem do Quicksort?',
      'image': 'assets/images/q3.png',
      'answers': [
        {'text': 'A) Sempre ocupa pouca memória', 'isCorrect': false},
        {'text': 'B) É estável em qualquer implementação', 'isCorrect': false},
        {
          'text': 'C) É eficiente para grandes conjuntos de dados',
          'isCorrect': true,
        },
        {'text': 'D) Não é eficiente', 'isCorrect': false},
      ],
      'explanation':
          'Uma das vantagens do Quicksort é sua eficiência em ordenar grandes conjuntos de dados, devido à sua complexidade média de O(n log n).',
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
        if (contador < 3200) {
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
    final vidas = Provider.of<Counter>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz em Flutter'),
      ),
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bubble/bg7.png'), // Caminho da imagem
            fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
          ),
        ),*/
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            // exibe o texto da pergunta, acessando currentQuestion['questionText'],
                            // que é um mapa que contém a pergunta atual.
                            currentQuestion['questionText'] as String,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Image.asset(
                            // Image.asset(...) exibe uma imagem associada à pergunta, obtida em currentQuestion['image'].
                            currentQuestion['image'] as String,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 24),
                          // O valor correspondente a 'answers' é uma lista de mapas (List<Map<String, Object>>),
                          // onde cada mapa contém informações sobre uma resposta, como o texto da resposta e se ela é a correta ou não.
                          ...(currentQuestion['answers']
                                  as List<Map<String, Object>>)
                              .map(
                            // answer variavel que representa cada elemento da lista de respostas.
                            (answer) {
                              Color buttonColor; // guarda cor
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
                                      : null, // aqui ele deixa os botões nulo
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          // formatação das propriedas do texto de feedback
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
                          const SizedBox(height: 16),
                          // formatação das propriedas da resposta do usuário (correta ou não)
                          if (_isAnswerCorrect != null)
                            CustomButton(
                              text: _isAnswerCorrect!
                                  ? 'Próxima pergunta'
                                  : 'Tente novamente', // nome que aparece dentro do botão
                              color:
                                  _isAnswerCorrect! ? Colors.blue : Colors.red,
                              onPressed: _isAnswerCorrect!
                                  // foi pressionado? sim, anula tudo e vai oara proxima pergunta
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
