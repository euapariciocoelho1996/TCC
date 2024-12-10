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

 // Importando o pacote de áudio


class QuizScreenBubble1 extends StatefulWidget {
  const QuizScreenBubble1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenBubble1State createState() => _QuizScreenBubble1State();
}

class _QuizScreenBubble1State extends State<QuizScreenBubble1> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText': 'Quando o Bubble Sort pode ser mais eficiente?',
      'image': 'assets/images/b1.png',
      'answers': [
        {'text': 'A) Quando a lista é longa e aleatória', 'isCorrect': false},
        {'text': 'B) Quando a lista já está quase ordenada', 'isCorrect': true},
        {
          'text': 'C) Quando tem muitos elementos duplicados',
          'isCorrect': false
        },
        {'text': 'D) Nunca é eficiente', 'isCorrect': false},
      ],
      'explanation':
          'O Bubble Sort é mais eficiente quando a lista já está quase ordenada, pois, ao percorrer a lista, ele realiza poucas trocas. Isso acontece porque o algoritmo tenta "bubbling up" os elementos maiores para o final da lista, e se a lista já está parcialmente ordenada, o número de comparações e trocas diminui significativamente.',
    },
    {
      'questionText': 'Como o Bubble Sort compara elementos?',
      'image': 'assets/images/b2.png',
      'answers': [
        {
          'text': 'A) Compara pares adjacentes e os troca, se necessário',
          'isCorrect': true
        },
        {'text': 'B) Divide a lista em duas metades', 'isCorrect': false},
        {
          'text': 'C) Escolhe sempre o menor elemento restante',
          'isCorrect': false
        },
        {'text': 'D) Utiliza uma árvore de busca binária', 'isCorrect': false},
      ],
      'explanation':
          'O Bubble Sort compara elementos adjacentes em uma lista e os troca se estiverem fora de ordem. Ele faz isso em repetidas passagens pela lista, até que todos os elementos fiquem ordenados. Esse processo de "bubbling" pode ser ineficiente para listas grandes, mas funciona bem para listas pequenas ou quase ordenadas.',
    },
    {
      'questionText': 'Qual é a principal característica do Bubble Sort?',
      'image': 'assets/images/b3.png',
      'answers': [
        {'text': 'A) É um algoritmo de busca binária', 'isCorrect': false},
        {
          'text': 'B) Faz várias passagens para ordenar a lista',
          'isCorrect': true
        },
        {
          'text': 'C) É um algoritmo de ordenação por seleção',
          'isCorrect': false
        },
        {'text': 'D) Divide a lista em várias partes', 'isCorrect': false},
      ],
      'explanation':
          'A principal característica do Bubble Sort é que ele realiza várias passagens pela lista, comparando e trocando elementos adjacentes até que a lista esteja ordenada. A cada passagem, o maior elemento é movido para o final da lista, o que garante que a lista vá ficando mais ordenada a cada iteração.',
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
        if (contador < 300) {
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
        title: const Text('Quiz Time'),
      ),
      body: Stack(
        children: [
          CustomBackground(),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/bubble/1.jpg'), // Referência à imagem local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
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
                            currentQuestion['questionText'] as String,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 0, 0, 0), // Cor da borda
                                width: 1, // Largura da borda
                              ),
                              borderRadius: BorderRadius.circular(
                                  10), // Bordas arredondadas (opcional)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // Aplicar o mesmo arredondamento
                              child: Image.asset(
                                currentQuestion['image'] as String,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ...(currentQuestion['answers']
                                  as List<Map<String, Object>>)
                              .map(
                            (answer) {
                              Color buttonColor;
                              if (_isAnswerCorrect == null) {
                                buttonColor =
                                    const Color.fromARGB(255, 255, 255, 255);
                              } else if (answer['isCorrect'] ==
                                  _isAnswerCorrect) {
                                buttonColor = _isAnswerCorrect!
                                    ? Colors.green
                                    : Colors.red;
                              } else {
                                buttonColor =
                                    const Color.fromARGB(255, 255, 255, 255);
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
                          const SizedBox(height: 16),
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
            ),
          )
        ],
      ),
    );
  }
}
