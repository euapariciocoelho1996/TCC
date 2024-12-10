import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:projeto_tcc_flutter/Bubble2/botao1.dart';
import 'package:projeto_tcc_flutter/Bubble2/messages.dart';
import 'package:projeto_tcc_flutter/Novo-quiz/dialogsAcerto.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/fundo.dart';

class CodeCompletionPage extends StatefulWidget {
  @override
  _CodeCompletionPageState createState() => _CodeCompletionPageState();
}

class _CodeCompletionPageState extends State<CodeCompletionPage> {
  // Lista de perguntas
  final List<Map<String, dynamic>> questions = [
    {
      'codeBefore': '''
void main() {
  var nome = "''',
      'codeAfter': '''";
  print(nome);
}
''',
      'options': ["'João'", "'Maria'", "'Pedro'"],
      'correctAnswer': "'João'",
    },
    {
      'codeBefore': '''
int soma(int a, int b) {
  return a + ''',
      'codeAfter': '''; 
}
''',
      'options': ["b", "c", "a"],
      'correctAnswer': "b",
    },
    {
      'codeBefore': '''
for (int i = 0; i < 10; ''',
      'codeAfter': ''') {
  print(i);
}
''',
      'options': ["i++", "i--", "++i"],
      'correctAnswer': "i++",
    },
  ];

  int currentQuestionIndex = 0;
  String selectedOption = "";
  bool showNextButton = false;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: customAppBar('Complete o Código'),
      body: Stack(
        children: [
          CustomBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exibição do código completo
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[700]!),
                      ),
                      child: HighlightView(
                        currentQuestion['codeBefore'] +
                            (selectedOption.isEmpty ? '___' : selectedOption) +
                            currentQuestion['codeAfter'],
                        language: 'dart',
                        theme: monokaiSublimeTheme,
                        textStyle: const TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Exibição das opções
                    Center(
                      child: Text(
                        "Escolha uma opção para completar o código:",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: (currentQuestion['options'] as List<String>)
                              .map((option) {
                            return Botao1(
                                text: option,
                                color: const Color.fromARGB(255, 236, 118, 7),
                                onPressed: () {
                                  setState(() {
                                    selectedOption = option;
                                    showNextButton = false;
                                  });
                                });
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Botão para verificar a resposta
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Botao1(
                              text: 'Verificar Resposta',
                              color: const Color.fromARGB(255, 5, 141, 239),
                              onPressed: () {
                                if (selectedOption ==
                                    currentQuestion['correctAnswer']) {
                                  setState(() {
                                    showNextButton = true;
                                  });
                                  showCorrectAnswerDialog(
                                    context: context,
                                    correctMessage: getRandomCorrectMessage(),
                                    explanation: '',
                                    textoBotao: 'Isso ai!',
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Resposta incorreta, tente novamente."),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if (showNextButton)
                          Botao1(
                            text: 'Próxima Pergunta',
                            color: const Color.fromARGB(255, 236, 7, 190),
                            onPressed: () {
                              setState(() {
                                if (currentQuestionIndex <
                                    questions.length - 1) {
                                  currentQuestionIndex++;
                                } else {
                                  currentQuestionIndex =
                                      0; // Reinicia se for a última pergunta
                                }
                                selectedOption = "";
                                showNextButton = false;
                              });
                            },
                          )
                      ],
                    ),

                    // Botão para pular para a próxima pergunta
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

void main() {
  runApp(MaterialApp(
    title: 'Complete o Código',
    home: CodeCompletionPage(),
  ));
}
