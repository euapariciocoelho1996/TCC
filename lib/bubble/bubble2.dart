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

class QuizScreenBubble2 extends StatefulWidget {
  const QuizScreenBubble2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenBubble2State createState() => _QuizScreenBubble2State();
}

class _QuizScreenBubble2State extends State<QuizScreenBubble2> {
  final List<Map<String, Object>> _perguntas = [
    {
      'questionText':
          'Para que servem as variáveis int i, j, temp; no algoritmo Bubble Sort?',
      'image':
          'assets/images/b-cod.png', // Substitua pelo caminho da sua imagem, se necessário
      'answers': [
        {
          'text':
              'A) i e j armazenam elementos do array, temp indica que o array está ordenado.',
          'isCorrect': false
        },
        {
          'text':
              'B) i conta passagens, j percorre elementos, temp armazena temporariamente.',
          'isCorrect': true
        },
        {
          'text':
              'C) Todas as variáveis calculam a soma dos elementos do array.',
          'isCorrect': false
        },
        {
          'text':
              'D) i e j verificam se o array está ordenado, temp armazena a média.',
          'isCorrect': false
        },
      ],
      'explanation':
          'No algoritmo Bubble Sort, as variáveis desempenham papéis importantes. A variável `i` é usada para contar o número de passagens pelo array, enquanto `j` é usada para percorrer os elementos adjacentes e compará-los. A variável `temp` é usada para armazenar temporariamente um elemento durante a troca de posições dos elementos adjacentes.',
    },
    {
      'questionText': 'Explique a linha 8 e 9',
      'image': 'assets/images/b-cod.png',
      'answers': [
        {
          'text': 'A) arr[j] não passa a ter o valor que estava em arr[j+1]',
          'isCorrect': false,
          'explanation':
              'A troca entre os elementos de `arr[j]` e `arr[j+1]` é feita de forma que o elemento maior seja movido para a posição correta.',
        },
        {
          'text':
              'B) arr[j+1] agora contém o valor que estava em arr[j] antes da troca',
          'isCorrect': true,
          'explanation':
              'Quando a troca é feita entre `arr[j]` e `arr[j+1]`, o valor de `arr[j]` é armazenado temporariamente e depois substitui o valor de `arr[j+1]`, fazendo com que `arr[j+1]` tenha o valor de `arr[j]` após a troca.',
        },
        {'text': 'C) Compara os elementos', 'isCorrect': false},
        {'text': 'D) Nenhuma das alternativas', 'isCorrect': false},
      ],
      'explanation':
          'As linhas 8 e 9 do Bubble Sort realizam uma troca entre os elementos `arr[j]` e `arr[j+1]` caso eles estejam fora de ordem. Isso é feito utilizando uma variável temporária (`temp`) para armazenar o valor de `arr[j]` enquanto o valor de `arr[j+1]` é movido para a posição de `arr[j]`.',
    },
    {
      'questionText':
          'O que acontece se o primeiro laço for removido do Bubble Sort?',
      'image': 'assets/images/b-cod.png',
      'answers': [
        {'text': 'A) A troca de elementos no array', 'isCorrect': false},
        {
          'text': 'B) O algoritmo não funcionará e causará um erro',
          'isCorrect': false,
          'explanation':
              'Embora o algoritmo não gere um erro diretamente, a remoção do primeiro laço impediria o Bubble Sort de percorrer a lista corretamente, fazendo com que o algoritmo não funcione como esperado.',
        },
        {'text': 'C) O array ficará completamente vazio', 'isCorrect': false},
        {'text': 'D) Impede a ordenação completa do array', 'isCorrect': true},
      ],
      'explanation':
          'O primeiro laço no Bubble Sort é crucial, pois ele faz as múltiplas passagens pela lista de elementos. Se esse laço for removido, o algoritmo não conseguiria percorrer todos os elementos adequadamente e não completaria a ordenação da lista. A lista ficaria parcialmente ordenada ou não ordenada, dependendo do estado inicial.',
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
        if (contador < 600) {
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0),
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
          )
        ],
      ),
    );
  }
}
