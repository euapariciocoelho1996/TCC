import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart'; // Importando o pacote de confetes
import 'package:projeto_tcc_flutter/GameOver.dart';
import 'package:projeto_tcc_flutter/Novo-quiz/dialogsAcerto.dart';
import 'package:projeto_tcc_flutter/Novo-quiz/dialogsErro.dart';
import 'package:projeto_tcc_flutter/Novo-quiz/perguntas.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/Vidas.dart';
import 'dart:math';
import 'package:projeto_tcc_flutter/cusom-AppBar.dart';
import 'package:projeto_tcc_flutter/fundo.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:provider/provider.dart';

void main() => runApp(QuizAppB());

class QuizAppB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;
  bool answered = false; // Controla se a pergunta foi respondida
  final List<Map<String, Object>> _perguntas = perguntas;

  final List<String> correctMessages = [
    'Parabéns! Você acertou!',
    'Muito bem! Resposta correta!',
    'Excelente! Resposta certa!',
    'Ótimo trabalho! Você acertou!'
  ];

  final List<String> wrongMessages = [
    'Ops! Tente novamente!',
    'Que pena! Resposta errada!',
    'Não foi dessa vez! Tente de novo!',
    'Hmmm... resposta incorreta, tente outra vez!'
  ];

  // Controlador de confetes
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  // Função para obter uma mensagem aleatória de acerto
  String getRandomCorrectMessage() {
    final random = Random();
    return correctMessages[random.nextInt(correctMessages.length)];
  }

  // Função para obter uma mensagem aleatória de erro
  String getRandomWrongMessage() {
    final random = Random();
    return wrongMessages[random.nextInt(wrongMessages.length)];
  }

  void answerQuestion(bool isCorrect, String explanation) {
    setState(() {
      answered = true; // Marca que a pergunta foi respondida
    });

    if (isCorrect) {
      score++;
      final contador = Provider.of<Counter>(context, listen: false).count;
      if (contador < 300) {
        Provider.of<Counter>(context, listen: false).increment();
      }
      // Iniciar o efeito de confetes
      confettiController.play();

      // Exibir o AlertDialog com a explicação quando a resposta for correta
      showCorrectAnswerDialog(
        context: context,
        correctMessage: getRandomCorrectMessage(),
        explanation: explanation,
        onNextQuestion: nextQuestion,
      );
    } else {
      // Exibir um feedback apenas se a resposta for errada
      final vidas = Provider.of<Counter>(context, listen: false);
      if (!isCorrect) {
        if (vidas.vidas == 1) {
          vidas.perderVida();
          Gameover.mostrarGameOver(context);
        } else {
          vidas.perderVida();
          showWrongAnswerDialog(
            context: context,
            onRetry: () {
              setState(() {
                answered = false; // Permite que o usuário tente novamente
              });
            },
            getRandomWrongMessage: getRandomWrongMessage,
          );
        }
      }
    }
  }

  void nextQuestion() {
    setState(() {
      questionIndex++;
      answered = false; // Reseta o estado de "respondido"
    });
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questionIndex >= _perguntas.length) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Quiz Time'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você acertou $score de ${_perguntas.length} perguntas!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                    score = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: const Color.fromARGB(255, 243, 121, 33),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 60), // Aumentando a altura
                ),
                child: Text('Tentar Novamente'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = _perguntas[questionIndex];

    // Cálculo do progresso (percentual)
    double progress = (questionIndex + 1) / _perguntas.length;

    return Scaffold(
      appBar: CustomAppBar(title: 'Quiz Time'),
      body: Stack(
        children: [
          CustomBackground(),

          // Confetes ao acertar a resposta, que será exibido por cima do AlertDialog
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200], // Cor de fundo da barra
                    valueColor: AlwaysStoppedAnimation<Color>(
                        const Color.fromARGB(
                            255, 115, 219, 4)), // Cor da linha de progresso
                  ),
                  SizedBox(height: 20),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      VidaCoracoes(),

                      // Barra de Progresso

                      SizedBox(height: 20),
                      // Exibindo a pergunta atual
                      Image.asset(
                        currentQuestion['image'] as String,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Text(
                        currentQuestion['questionText'] as String,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      // Exibindo as opções de resposta
                      ...List.generate(
                        (currentQuestion['answers']
                                as List<Map<String, Object>>)
                            .length,
                        (index) {
                          final answer = (currentQuestion['answers']
                              as List<Map<String, Object>>)[index];
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: answered
                                    ? null
                                    : () => answerQuestion(
                                          answer['isCorrect'] as bool,
                                          currentQuestion['explanation']
                                              as String,
                                        ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  backgroundColor:
                                      const Color.fromARGB(255, 243, 121, 33),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: Size(double.infinity, 60),
                                ),
                                child: Text(answer['text'] as String),
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
