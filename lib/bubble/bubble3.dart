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


class QuizScreenBubble3 extends StatefulWidget {
  const QuizScreenBubble3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenBubble3State createState() => _QuizScreenBubble3State();
}

class _QuizScreenBubble3State extends State<QuizScreenBubble3> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Como o algoritmo Bubble Sort detecta que a lista está ordenada?',
      'image':
          'assets/bubble/b2.png', // Substitua pelo caminho da sua imagem, se necessário
      'answers': [
        {
          'text': 'A) Ao encontrar o elemento mediano',
          'isCorrect': false,
          'explanation':
              'O algoritmo Bubble Sort não usa a posição do elemento mediano para detectar se a lista está ordenada, pois seu funcionamento é baseado em comparações e trocas entre elementos adjacentes.'
        },
        {
          'text': 'B) Ao completar todas as iterações',
          'isCorrect': false,
          'explanation':
              'O Bubble Sort normalmente completa todas as iterações, mas é possível detectar que a lista está ordenada antes, caso nenhuma troca seja feita em uma passagem.'
        },
        {
          'text': 'C) Quando nenhuma troca é feita em uma passagem',
          'isCorrect': true,
          'explanation':
              'Durante uma passagem pelo array, se nenhuma troca é realizada, isso significa que todos os elementos estão na ordem correta, indicando que a lista está ordenada. Assim, o algoritmo pode interromper o processo, economizando tempo de execução.'
        },
        {
          'text': 'D) Quando encontra o maior elemento',
          'isCorrect': false,
          'explanation':
              'O Bubble Sort identifica o maior elemento em cada passagem e o move para o final, mas isso sozinho não indica que a lista inteira está ordenada.'
        },
      ],
      'explanation':
          'No Bubble Sort, uma lista é considerada ordenada se, ao completar uma passagem por todos os elementos, nenhuma troca é necessária. Esse é um sinal de que todos os elementos já estão na posição correta, permitindo que o algoritmo termine antes do total de iterações.'
    },
    {
      'questionText': 'Quando o Bubble Sort pode ser eficiente?',
      'image':
          'assets/bubble/b3.png', // Substitua pelo caminho da sua imagem, se necessário
      'answers': [
        {
          'text': 'A) Com grandes conjuntos de dados desordenados',
          'isCorrect': false,
          'explanation':
              'Para grandes conjuntos de dados desordenados, o Bubble Sort é ineficiente devido ao seu tempo de execução quadrático (O(n^2)), o que o torna pouco adequado para grandes listas desordenadas.'
        },
        {
          'text': 'B) Com pequenas listas quase ordenadas',
          'isCorrect': true,
          'explanation':
              'O Bubble Sort é eficiente com listas pequenas e quase ordenadas, pois ele rapidamente identifica e realiza as poucas trocas necessárias, especialmente quando nenhuma troca é feita em uma passagem, permitindo que o algoritmo termine mais cedo.'
        },
        {
          'text': 'C) Ao lidar com dados aleatórios de alta complexidade',
          'isCorrect': false,
          'explanation':
              'Para dados aleatórios complexos, o Bubble Sort é ineficiente devido ao seu tempo de execução O(n^2). Algoritmos como Quick Sort ou Merge Sort são mais recomendados para conjuntos grandes e aleatórios.'
        },
        {
          'text': 'D) Em grandes bases de dados paralelas',
          'isCorrect': false,
          'explanation':
              'O Bubble Sort não é uma boa escolha para grandes bases de dados paralelas devido à sua complexidade quadrática e à dificuldade em ser paralelizado.'
        },
      ],
      'explanation':
          'O Bubble Sort é adequado para listas pequenas e quase ordenadas. Em listas com poucos elementos fora de ordem, ele consegue ordená-las rapidamente, sendo eficiente para esse caso específico, enquanto para listas grandes, algoritmos mais complexos são recomendados.'
    },
    {
      'questionText':
          'O que acontece se o primeiro laço for removido do Bubble Sort?',
      'image':
          'assets/bubble/b-cod.png', // Substitua pelo caminho da sua imagem, se necessário
      'answers': [
        {
          'text': 'A) A troca de elementos no array',
          'isCorrect': false,
          'explanation':
              'Remover o primeiro laço não resulta em uma simples troca de elementos, mas impede que o algoritmo faça múltiplas passagens pela lista, essenciais para a ordenação.'
        },
        {
          'text': 'B) O algoritmo não funcionará e causará um erro',
          'isCorrect': false,
          'explanation':
              'Embora o algoritmo não gere um erro diretamente, ele deixará de funcionar como esperado, pois não conseguirá ordenar o array sem as passagens repetidas sobre os elementos.'
        },
        {
          'text': 'C) O array ficará completamente vazio',
          'isCorrect': false,
          'explanation':
              'Remover o primeiro laço não esvazia o array, mas afeta a lógica de repetição necessária para o algoritmo ordenar a lista.'
        },
        {
          'text': 'D) Impede a ordenação completa do array',
          'isCorrect': true,
          'explanation':
              'O primeiro laço é necessário para que o algoritmo percorra a lista várias vezes, realizando todas as trocas necessárias para ordenar o array. Remover esse laço impediria que o algoritmo completasse a ordenação, deixando a lista desordenada.'
        },
      ],
      'explanation':
          'O primeiro laço no Bubble Sort é fundamental, pois garante que o algoritmo faça múltiplas passagens pela lista para realizar todas as trocas necessárias. Sem ele, o algoritmo não completaria a ordenação dos elementos.'
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
        if (contador < 900) {
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
