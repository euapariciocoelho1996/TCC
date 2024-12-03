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
      appBar: AppBar(
        title: Text("Selecione o Nível"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.png"), // Caminho da imagem
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho da tela
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Imagem de fundo
                Container(
                  width: 350,
                  height: 130,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/estilo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                // Texto sobreposto
                Text(
                  'A arte das decisões: IF/ELSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildNivelButton(context, "Fácil", 0),
            _buildNivelButton(context, "Intermediário", 1),
            _buildNivelButton(context, "Avançado", 2),
          ],
        ),
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
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 249, 247, 247),
          backgroundColor: const Color.fromRGBO(255, 125, 151, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: Size(200, 60),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Nível ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text: nivel,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w900,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

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
            "int x = 10;",
            "if (x > 5) {",
            "    printf(\"x é maior que 5\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é maior que 5 e imprime a mensagem correspondente."
        },
        {
          'codigo': [
            "int x = 0;",
            "if (x) {",
            "    printf(\"x é verdadeiro\\n\");",
            "} else {",
            "    printf(\"x é falso\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é verdadeiro (diferente de zero) ou falso (zero)."
        },
        {
          'codigo': [
            "int x = 5;",
            "if (x < 3) {",
            "    printf(\"Menor que 3\\n\");",
            "} else {",
            "    printf(\"Maior ou igual a 3\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é menor que 3 ou maior/igual a 3 e imprime a mensagem correspondente."
        }
      ],
      // Nível Intermediário
      [
        {
          'codigo': [
            "int x = 5;",
            "if (x == 5) {",
            "    printf(\"Cinco\\n\");",
            "} else {",
            "    printf(\"Outro\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é igual a 5 e imprime 'Cinco', caso contrário, imprime 'Outro'."
        },
        {
          'codigo': [
            "int x = -1;",
            "if (x > 0) {",
            "    printf(\"Positivo\\n\");",
            "} else if (x == 0) {",
            "    printf(\"Zero\\n\");",
            "} else {",
            "    printf(\"Negativo\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é positivo, zero ou negativo e imprime a mensagem correspondente."
        },
        {
          'codigo': [
            "int x = 10;",
            "if (x >= 10) {",
            "    printf(\"x é maior ou igual a 10\\n\");",
            "} else {",
            "    printf(\"x é menor que 10\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é maior ou igual a 10 e imprime a mensagem correspondente."
        },
        {
          'codigo': [
            "int x = 8;",
            "if (x % 2 == 0) {",
            "    printf(\"Número par\\n\");",
            "} else {",
            "    printf(\"Número ímpar\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se o número x é par ou ímpar e imprime a mensagem correspondente."
        }
      ],
      // Nível Avançado
      [
        {
          'codigo': [
            "int x = 7;",
            "if (x > 0 && x % 2 == 0) {",
            "    printf(\"Positivo e par\\n\");",
            "} else if (x > 0 && x % 2 != 0) {",
            "    printf(\"Positivo e ímpar\\n\");",
            "} else {",
            "    printf(\"Não positivo\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é positivo e par ou positivo e ímpar, e imprime a mensagem correspondente."
        },
        {
          'codigo': [
            "int soma(int x, int y) {",
            "    if (x > y) {",
            "        return x + y;",
            "    } else {",
            "        return x - y;",
            "    }",
            "}",
            "int main() {",
            "    printf(\"%d\\n\", soma(3, 4));",
            "}"
          ],
          'explicacao':
              "Este código usa uma função para somar ou subtrair dois números com base em uma condição."
        },
        {
          'codigo': [
            "int x = 10, y = 5;",
            "if (x > y) {",
            "    if (x % 2 == 0) {",
            "        printf(\"x é par e maior que y\\n\");",
            "    }",
            "} else {",
            "    printf(\"x não é maior que y\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se x é maior que y e, em caso afirmativo, verifica se x é par."
        },
        {
          'codigo': [
            "int idade = 20;",
            "if (idade >= 18) {",
            "    if (idade < 21) {",
            "        printf(\"Você é maior de idade, mas ainda não tem 21 anos.\\n\");",
            "    } else {",
            "        printf(\"Você tem 21 anos ou mais.\\n\");",
            "    }",
            "} else {",
            "    printf(\"Você é menor de idade.\\n\");",
            "}"
          ],
          'explicacao':
              "Este código verifica se a pessoa é maior de idade e, em seguida, verifica a faixa etária para imprimir a mensagem correspondente."
        }
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
      appBar: AppBar(
        title: Text(
          "Complete o Código em C",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 255, 255), // Cor dos ícones
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.png"), // Imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho do Drawer
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Imagem de fundo
                      Container(
                        width: 300,
                        height: 120,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/estilo.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      // Texto sobreposto
                      Text(
                        'Teste suas habilidades',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Center(
                      child: Text(
                    'Organize o código na ordem correta da sintaxe!',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
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
                            height: 45,
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 3, 3, 3),
                                  width: 2),
                              color: espacosPreenchidos[index] != null
                                  ? const Color.fromRGBO(246, 224, 73, 1)
                                  : Colors.white,
                            ),
                            child: Text(
                              espacosPreenchidos[index] ?? "_________",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'monospace',
                                  color: Colors.black),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 7.0,
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
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (espacosPreenchidos.join() == codigoAlvo.join()) {
                          _confettiController.play();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Parabéns!"),
                                content: const Text("Você acertou a resposta!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Apenas fecha o diálogo
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );

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
                                  content: Text(
                                      'Você completou esta revisão! Fique de olho na próxima tarefa!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Fechar o dialog
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
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 249, 247, 247),
                        backgroundColor: const Color.fromRGBO(40, 23, 206, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(200, 60),
                      ),
                      child: const Text("VERIFICAR"),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _scrollToBottom,
                child: Icon(Icons.arrow_downward),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment
                      .topCenter, // Posiciona o confete no topo da tela
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection:
                        3 * pi / 2, // Direção para baixo (270 graus)
                    maxBlastForce: 5, // Velocidade inicial máxima
                    minBlastForce: 2, // Velocidade inicial mínima
                    emissionFrequency: 0.05, // Frequência de emissão
                    numberOfParticles: 30, // Número de partículas
                    gravity: 0.3, // Velocidade de queda
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrechoTile(String trecho, bool isDragging,
      {bool dragging = false}) {
    return Material(
      color: const Color.fromARGB(101, 0, 0, 0),
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
