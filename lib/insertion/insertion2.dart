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


class QuizScreenInsertion2 extends StatefulWidget {
  const QuizScreenInsertion2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenInsertion2State createState() => _QuizScreenInsertion2State();
}

class _QuizScreenInsertion2State extends State<QuizScreenInsertion2> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Qual é o objetivo da variável "chave" no Insertion Sort?',
      'image': 'assets/images/insertionCodigo.png',
      'answers': [
        {'text': 'A) Armazenar o valor máximo da lista', 'isCorrect': false},
        {
          'text': 'B) Contar o número de elementos na lista',
          'isCorrect': false
        },
        {
          'text': 'C) Armazenar o elemento atual a ser inserido',
          'isCorrect': true
        },
        {'text': 'D) Ordenar a lista em ordem decrescente', 'isCorrect': false},
      ],
      'explanation':
          'A variável "chave" no Insertion Sort armazena temporariamente o elemento atual que está sendo comparado e posicionado na parte ordenada da lista.',
    },
    {
      'questionText':
          'O que a condição "j >= 0 && arr[j] > chave" verifica no loop?',
      'image': 'assets/images/insertionCodigo.png',
      'answers': [
        {
          'text': 'A) Se o índice j é válido e se o elemento é menor que chave',
          'isCorrect': false,
        },
        {
          'text':
              'B) Se o índice j é maior que zero e se o elemento é maior que chave',
          'isCorrect': true,
        },
        {
          'text': 'C) Se todos os elementos já foram verificados',
          'isCorrect': false
        },
        {
          'text': 'D) Se a lista está completamente ordenada',
          'isCorrect': false
        },
      ],
      'explanation':
          'A condição "j >= 0 && arr[j] > chave" verifica se o índice ainda é válido e se o elemento atual é maior que a chave, indicando que o elemento deve ser movido para frente.',
    },
    {
      'questionText': 'O que acontece na linha "arr[j + 1] = chave;"?',
      'image': 'assets/images/insertionCodigo.png',
      'answers': [
        {'text': 'A) O elemento chave é removido da lista', 'isCorrect': false},
        {
          'text': 'B) O elemento chave é inserido na posição correta',
          'isCorrect': true,
        },
        {'text': 'C) O valor de chave é duplicado', 'isCorrect': false},
        {
          'text': 'D) O valor de chave é comparado com o próximo elemento',
          'isCorrect': false,
        },
      ],
      'explanation':
          'A linha "arr[j + 1] = chave;" insere o elemento chave na posição correta dentro da parte ordenada da lista.',
    },
    {
      'questionText':
          'Qual é o propósito do loop externo "for (int i = 1; i < n; i++)"?',
      'image': 'assets/images/insertionCodigo.png',
      'answers': [
        {
          'text': 'A) Para percorrer todos os elementos da lista',
          'isCorrect': true
        },
        {
          'text': 'B) Para contar o número de elementos na lista',
          'isCorrect': false
        },
        {
          'text': 'C) Para ordenar a lista em ordem decrescente',
          'isCorrect': false
        },
        {
          'text': 'D) Para armazenar o último elemento da lista',
          'isCorrect': false
        },
      ],
      'explanation':
          'O loop externo "for (int i = 1; i < n; i++)" percorre todos os elementos da lista, começando do segundo, para inseri-los na parte ordenada da lista.',
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
        if (contador < 2500) {
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
