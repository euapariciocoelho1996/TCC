import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:projeto_tcc_flutter/ShowDialog.dart';
import 'package:projeto_tcc_flutter/revisao/funcao/funcao-alert.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:projeto_tcc_flutter/revisao/titulo-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo2-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo3-rev.dart';
import 'dart:math';

import 'package:projeto_tcc_flutter/t.dart';

void main() => runApp(CodigoCAppFuncoes());

class CodigoCAppFuncoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SelecionarNivelFuncoes(),
    );
  }
}

// Tela de seleção de nível
class SelecionarNivelFuncoes extends StatelessWidget {
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
                  width: 300,
                  height: 140,
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
                  'Funções',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
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
      floatingActionButton: const MyFloatingButton(),
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
      [
        {
          'codigo': [
            "int soma(int a, int b) {",
            "    return a + b;",
            "}",
            "int main() {",
            "    printf(\"Resultado: %d\\n\", soma(3, 2));",
            "}"
          ],
          'explicacao': "Função para somar dois números e imprimir o resultado."
        },
        {
          'codigo': [
            "void imprimeMensagem() {",
            "    printf(\"Olá, funções!\\n\");",
            "}",
            "int main() {",
            "    imprimeMensagem();",
            "}"
          ],
          'explicacao': "Função para imprimir uma mensagem na tela."
        },
        {
          'codigo': [
            "int quadrado(int x) {",
            "    return x * x;",
            "}",
            "int main() {",
            "    printf(\"Quadrado: %d\\n\", quadrado(4));",
            "}"
          ],
          'explicacao': "Função que calcula o quadrado de um número."
        }
      ],
      [
        {
          'codigo': [
            "int maior(int a, int b) {",
            "    return (a > b) ? a : b;",
            "}",
            "int main() {",
            "    printf(\"Maior: %d\\n\", maior(10, 15));",
            "}"
          ],
          'explicacao': "Função que retorna o maior entre dois números."
        },
        {
          'codigo': [
            "int fatorial(int n) {",
            "    return (n <= 1) ? 1 : n * fatorial(n - 1);",
            "}",
            "int main() {",
            "    printf(\"Fatorial: %d\\n\", fatorial(5));",
            "}"
          ],
          'explicacao': "Função recursiva para calcular o fatorial."
        },
        {
          'codigo': [
            "int primo(int n) {",
            "    for (int i = 2; i < n; i++)",
            "        if (n % i == 0) return 0;",
            "    return n > 1;",
            "}",
            "int main() { printf(\"7 é primo: %d\\n\", primo(7)); }"
          ],
          'explicacao': "Função que verifica se um número é primo."
        }
      ],
      [
        {
          'codigo': [
            "void inverter(char *s) {",
            "    for (int i = 0, n = strlen(s); i < n / 2; i++) {",
            "        char tmp = s[i]; s[i] = s[n - i - 1]; s[n - i - 1] = tmp;",
            "    }",
            "}",
            "int main() { char s[] = \"abcd\"; inverter(s); printf(\"%s\\n\", s); }"
          ],
          'explicacao': "Função que inverte os caracteres de uma string."
        },
        {
          'codigo': [
            "int fibonacci(int n) {",
            "    return (n <= 1) ? n : fibonacci(n - 1) + fibonacci(n - 2);",
            "}",
            "int main() {",
            "    for (int i = 0; i < 10; i++)",
            "        printf(\"%d \", fibonacci(i));",
            "}"
          ],
          'explicacao':
              "Calcula os primeiros números da sequência de Fibonacci."
        },
        {
          'codigo': [
            "double potencia(double base, int expo) {",
            "    return (expo == 0) ? 1 : base * potencia(base, expo - 1);",
            "}",
            "int main() {",
            "    printf(\"Resultado: %.2f\\n\", potencia(2.0, 3));",
            "}"
          ],
          'explicacao': "Calcula a potência de um número usando recursão."
        }
      ]
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
                  const SizedBox(height: 5),
                  Center(
                    child: AnimatedTyperText(),
                  ),
                  const SizedBox(height: 10),
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
                                  fontSize: 15,
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
                    runSpacing: 5.0,
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

                          if (perguntaAtual < desafios.length - 1) {
                            showCustomDialog(
                              context: context,
                              title: "Parabéns!",
                              message:
                                  "Continue assim! Você está indo muito bem!",
                              confettiController: _confettiController,
                            );
                          }

                          if (perguntaAtual < desafios.length - 1) {
                            setState(() {
                              perguntaAtual++;
                              _carregarPergunta();
                            });
                          } else {
                            showCustomDialogWithoutParams(context);
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
    return Center(
      child: Container(
        width: 280,
        child: Material(
          elevation: isDragging ? 5 : 0,
          child: Center(
            child: Container(
              width: 280,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: dragging
                    ? Colors.grey
                    : const Color.fromARGB(255, 243, 121, 33),
              ),
              child: Text(
                trecho,
                style: const TextStyle(
                    fontSize: 16, fontFamily: 'monospace', color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
