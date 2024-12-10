import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/Bubble2/area-cod.dart';
import 'dart:math';

import 'package:projeto_tcc_flutter/Bubble2/botao1.dart';
import 'package:projeto_tcc_flutter/Bubble2/messages.dart';
import 'package:projeto_tcc_flutter/Novo-quiz/dialogsAcerto.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/fundo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espaços em Branco',
      home: const FillInTheBlanksScreen(),
    );
  }
}

class FillInTheBlanksScreen extends StatefulWidget {
  const FillInTheBlanksScreen({super.key});

  @override
  State<FillInTheBlanksScreen> createState() => _FillInTheBlanksScreenState();
}

class _FillInTheBlanksScreenState extends State<FillInTheBlanksScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'instruction': '''
void bubbleSort(int array[ ], int size) {
    for (int step = 0; step < size - 1; ++step) {
        for (int i = 0; i < size - step - 1; ++i) {
            if (___________) {
                int temp = array[i];
                array[i] = array[i + 1];
                array[i + 1] = temp;
            }
        }
    }
}
''',
      'blanks': [''],
      'options': [
        'i > j',
        'array[i] > array[i + 1]',
        'int temp = array[i];',
        '>'
      ],
      'correctOrder': ['array[i] > array[i + 1]'],
    },
    {
      'instruction':
          'Complete o código para realizar uma comparação e troca de elementos no Bubble Sort:',
      'blanks': ['', '', '', ''],
      'options': ['Dart', 'é', 'uma', 'linguagem'],
      'correctOrder': ['Dart', 'é', 'uma', 'linguagem'],
    },
    {
      'instruction':
          'Complete o código para realizar uma comparação e troca de elementos no Bubble Sort:',
      'blanks': ['', '', '', ''],
      'options': ['Flutter', 'torna', 'o', 'desenvolvimento'],
      'correctOrder': ['Flutter', 'torna', 'o', 'desenvolvimento'],
    },
  ];

  int _currentQuestionIndex = 0;
  int _currentIndex = 0;
  String _resultMessage = '';
  bool _isAnswerCorrect = false;

  List<String> _blanks = [];
  List<String> _options = [];
  List<String> _correctOrder = [];

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _loadQuestion() {
    setState(() {
      _blanks = List.from(_questions[_currentQuestionIndex]['blanks']);
      _options = List.from(_questions[_currentQuestionIndex]['options']);
      _correctOrder =
          List.from(_questions[_currentQuestionIndex]['correctOrder']);
      _options.shuffle(); // Embaralha as opções
      _currentIndex = 0;
      _resultMessage = '';
      _isAnswerCorrect = false;
    });
  }

  void _selectOption(String option) {
    if (_currentIndex < _blanks.length) {
      setState(() {
        _blanks[_currentIndex] = option;
        _currentIndex++;
        _options.remove(option);
      });
    }

    if (_currentIndex == _blanks.length) {
      _checkOrder();
    }
  }

  void _checkOrder() {
    setState(() {
      if (_blanks.join(' ') == _correctOrder.join(' ')) {
        showCorrectAnswerDialog(
          context: context,
          correctMessage: getRandomCorrectMessage(),
          explanation: '',
          textoBotao: 'Sou incrível',
        );
        _isAnswerCorrect = true;
      } else {
        _resultMessage = 'Tente novamente. ❌';
        _isAnswerCorrect = false;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _loadQuestion();
      } else {
        _showCompletionDialog();
      }
    });
  }

  void _reset() {
    setState(() {
      _currentQuestionIndex = 0;
      _loadQuestion();
    });
  }

  void _tryAgain() {
    setState(() {
      _blanks.fillRange(0, _blanks.length, ''); // Limpa os espaços
      _options = List.from(_questions[_currentQuestionIndex]['options']);
      _options.shuffle(); // Embaralha novamente as opções
      _currentIndex = 0;
      _resultMessage = '';
      _isAnswerCorrect = false;
    });
  }

  // Exibe o diálogo de conclusão
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Parabéns!'),
          content: const Text('Você completou todas as perguntas! 🎉'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ThankYouPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Preencha os Espaços'),
      body: Stack(
        children: [
          CustomBackground(),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CodeSnippet(
                      code: _questions[_currentQuestionIndex]
                          ['instruction'], // Passe o código aqui
                      language: 'C', // Defina a linguagem
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _blanks.map((blank) {
                        return Container(
                          width: 200,
                          height: 40,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(8.0),
                            color: blank.isEmpty
                                ? Colors.grey[200]
                                : Colors.blue[100],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            blank,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 400,
                      height: 150,
                      child: ListView(
                        children: [
                          Center(
                            child: Wrap(
                              spacing: 10,
                              children: _options.map((option) {
                                return Botao1(
                                  text: option,
                                  color:
                                      const Color.fromARGB(255, 213, 118, 23),
                                  onPressed: () => _selectOption(
                                      option), // Passa uma função anônima
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _resultMessage,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _resultMessage == 'Correto! 🎉'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _isAnswerCorrect
                        ? Botao1(
                            text: 'Próxima Pergunta',
                            color: const Color.fromARGB(255, 7, 236, 99),
                            onPressed: _nextQuestion)
                        : Botao1(
                            text: 'Tentar Novamente',
                            color: const Color.fromARGB(255, 5, 141, 239),
                            onPressed: _tryAgain),
                    const SizedBox(height: 10),
                    Botao1(
                        text: 'Reiniciar',
                        color: const Color.fromARGB(255, 218, 31, 196),
                        onPressed: _reset),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Nova página após completar as perguntas
class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Obrigado!')),
      body: Center(
        child: const Text(
          'Obrigado por participar! 🎉',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
