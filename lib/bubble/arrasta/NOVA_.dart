import 'package:flutter/material.dart';
import 'dart:math';

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
      'instruction':
          'Complete o código para realizar uma comparação e troca de elementos no Bubble Sort:',
      'blanks': ['', '', '', ''],
      'options': ['Flutter', 'é', 'muito', 'legal'],
      'correctOrder': ['Flutter', 'é', 'muito', 'legal'],
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
        _resultMessage = 'Correto! 🎉';
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
      appBar: AppBar(
        title: const Text('Preencha os Espaços'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _questions[_currentQuestionIndex]['instruction'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _blanks.map((blank) {
                return Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                    color: blank.isEmpty ? Colors.grey[200] : Colors.blue[100],
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
            Wrap(
              spacing: 10,
              children: _options.map((option) {
                return ElevatedButton(
                  onPressed: () => _selectOption(option),
                  child: Text(option),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              _resultMessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:
                    _resultMessage == 'Correto! 🎉' ? Colors.green : Colors.red,
              ),
            ),
            const Spacer(),
            _isAnswerCorrect
                ? ElevatedButton(
                    onPressed: _nextQuestion,
                    child: const Text('Próxima Pergunta'),
                  )
                : ElevatedButton(
                    onPressed: _tryAgain,
                    child: const Text('Tentar Novamente'),
                  ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _reset,
              child: const Text('Reiniciar'),
            ),
          ],
        ),
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
