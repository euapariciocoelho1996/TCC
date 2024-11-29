import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

void main() => runApp(CodigoCApp());

class CodigoCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SelecionarNivel(),
    );
  }
}

// Tela de seleção de nível
class SelecionarNivel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecione o Nível")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNivelButton(context, "Fácil", 0),
          _buildNivelButton(context, "Intermediário", 1),
          _buildNivelButton(context, "Avançado", 2),
        ],
      ),
    );
  }

  Widget _buildNivelButton(
      BuildContext context, String nivel, int dificuldade) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompletarCodigoC(dificuldade: dificuldade),
            ),
          );
        },
        child: Text("Nível $nivel"),
      ),
    );
  }
}

// Tela do jogo
class CompletarCodigoC extends StatefulWidget {
  final int dificuldade;

  const CompletarCodigoC({required this.dificuldade});

  @override
  _CompletarCodigoCState createState() => _CompletarCodigoCState();
}

class _CompletarCodigoCState extends State<CompletarCodigoC> {
  late List<Map<String, dynamic>> desafios;
  late int perguntaAtual;
  late List<String> codigoAlvo;
  late List<String> trechosDisponiveis;
  late String explicacao;
  late List<String?> espacosPreenchidos;

  // Controlador de confetes
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    _carregarDesafios(widget.dificuldade);
    perguntaAtual = 0;
    _carregarPergunta();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _carregarDesafios(int nivel) {
    final todosDesafios = [
      // Nível Fácil
      [
        {
          'codigo': [
            "#include <stdio.h>",
            "int main() {",
            "printf(\"Hello, World!\\n\");",
            "return 0;",
            "}"
          ],
          'explicacao':
              "Este é um programa simples em C que imprime a mensagem 'Hello, World!'"
        },
        {
          'codigo': [
            "int x = 10;",
            "int y = 20;",
            "int soma = x + y;",
            "printf(\"%d\\n\", soma);"
          ],
          'explicacao': "Este código calcula a soma de dois números inteiros."
        },
        {
          'codigo': [
            "float pi = 3.14;",
            "printf(\"O valor de pi é %.2f\\n\", pi);"
          ],
          'explicacao':
              "Este programa demonstra como usar números de ponto flutuante."
        },
        {
          'codigo': ["char letra = 'A';", "printf(\"%c\\n\", letra);"],
          'explicacao': "Este programa mostra como imprimir um caractere."
        },
      ],
      // Nível Intermediário
      [
        {
          'codigo': [
            "int x = 5;",
            "if (x > 0) {",
            "printf(\"x é positivo\\n\");",
            "}"
          ],
          'explicacao': "Este código verifica se um número é positivo."
        },
        {
          'codigo': [
            "int x = 10;",
            "while (x > 0) {",
            "printf(\"%d\\n\", x);",
            "x--; }"
          ],
          'explicacao':
              "Este programa utiliza um laço 'while' para contar regressivamente."
        },
        {
          'codigo': [
            "for (int i = 0; i < 3; i++) {",
            "printf(\"Linha %d\\n\", i);",
            "}"
          ],
          'explicacao':
              "Este programa usa um laço 'for' para imprimir linhas numeradas."
        },
        {
          'codigo': [
            "int x = 5;",
            "switch (x) {",
            "case 5: printf(\"Cinco\\n\"); break;",
            "default: printf(\"Outro\\n\"); }"
          ],
          'explicacao': "Este programa utiliza a estrutura 'switch'."
        },
      ],
      // Nível Avançado
      [
        {
          'codigo': [
            "int soma(int x, int y) {",
            "return x + y;",
            "}",
            "int main() {",
            "printf(\"%d\\n\", soma(3, 4));",
            "}"
          ],
          'explicacao': "Este programa demonstra como usar funções."
        },
        {
          'codigo': [
            "int vetor[3] = {1, 2, 3};",
            "for (int i = 0; i < 3; i++) {",
            "printf(\"%d\\n\", vetor[i]);",
            "}"
          ],
          'explicacao':
              "Este programa usa um vetor e um laço 'for' para imprimir elementos."
        },
        {
          'codigo': [
            "struct Ponto {",
            "int x;",
            "int y;",
            "};",
            "struct Ponto p = {1, 2};",
            "printf(\"x=%d, y=%d\\n\", p.x, p.y);"
          ],
          'explicacao':
              "Este programa usa uma estrutura (struct) para armazenar dados."
        },
        {
          'codigo': ["int x = 10;", "int *px = &x;", "printf(\"%d\\n\", *px);"],
          'explicacao': "Este programa demonstra como usar ponteiros."
        },
      ],
    ];

    desafios = todosDesafios[nivel];
  }

  void _carregarPergunta() {
    final desafio = desafios[perguntaAtual];
    codigoAlvo = desafio['codigo'];
    trechosDisponiveis = List.from(codigoAlvo)..shuffle();
    explicacao = desafio['explicacao'];
    espacosPreenchidos = List.filled(codigoAlvo.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete o Código em C")),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Column(
                  children: List.generate(codigoAlvo.length, (index) {
                    return DragTarget<String>(
                      onAccept: (trecho) {
                        setState(() {
                          espacosPreenchidos[index] = trecho;
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          width: double.infinity,
                          height: 60,
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            color: espacosPreenchidos[index] != null
                                ? Colors.lightBlueAccent
                                : Colors.white,
                          ),
                          child: Text(
                            espacosPreenchidos[index] ?? "_________",
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'monospace'),
                          ),
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: trechosDisponiveis.map((trecho) {
                    return Draggable<String>(
                      data: trecho,
                      child: _buildTrechoTile(trecho, false),
                      feedback: _buildTrechoTile(trecho, true),
                      childWhenDragging:
                          _buildTrechoTile(trecho, false, dragging: true),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (espacosPreenchidos.join() == codigoAlvo.join()) {
                      _confettiController.play();
                      if (perguntaAtual < desafios.length - 1) {
                        setState(() {
                          perguntaAtual++;
                          _carregarPergunta();
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Parabéns!'),
                              content: Text('Você completou a tarefa!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Fechar o dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelecionarNivel()), // Navegar para a próxima tela
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "Algum trecho está incorreto. Tente novamente!")),
                      );
                    }
                  },
                  child: const Text("Validar"),
                ),
              ],
            ),
          ),
          Center(
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 30,
              gravity: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrechoTile(String trecho, bool isDragging,
      {bool dragging = false}) {
    return Material(
      elevation: isDragging ? 5 : 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: dragging
                ? Colors.grey
                : const Color.fromARGB(255, 243, 121, 33),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            trecho,
            style: const TextStyle(
                fontSize: 16, fontFamily: 'monospace', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
