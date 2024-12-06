import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:projeto_tcc_flutter/ShowDialog.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:projeto_tcc_flutter/revisao/repeticao/repeticao-alert.dart';
import 'package:projeto_tcc_flutter/revisao/titulo-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo2-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo3-rev.dart';
import 'dart:math';

import 'package:projeto_tcc_flutter/t.dart';

void main() => runApp(CodigoCAppRepeticao());

class CodigoCAppRepeticao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SelecionarNivelRepeticao(),
    );
  }
}

// Tela de seleção de nível
class SelecionarNivelRepeticao extends StatelessWidget {
  const SelecionarNivelRepeticao({super.key});

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
                  'Laços de Repetição',
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
            "int main() {",
            "    for (int i = 1; i <= 10; i++)",
            "        printf(\"%d\\n\", i);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Imprime os números de 1 a 10 usando um laço `for`."
        },
        {
          'codigo': [
            "int main() {",
            "    int i = 1;",
            "    while (i <= 10)",
            "        printf(\"%d\\n\", i++);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Imprime os números de 1 a 10 usando um laço `while`."
        },
        {
          'codigo': [
            "int main() {",
            "    int i = 1;",
            "    do {",
            "        if (i % 2 == 0) printf(\"%d\\n\", i);",
            "    } while (++i <= 10);",
            "    return 0;",
            "}"
          ],
          'explicacao':
              "Imprime os números de 1 a 10 usando um laço `do-while`."
        }
      ],
      [
        {
          'codigo': [
            "int main() {",
            "    for (int i = 1; i <= 20; i++)",
            "        if (i % 2 == 0) printf(\"%d\\n\", i);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Imprime apenas os números pares de 1 a 20."
        },
        {
          'codigo': [
            "int main() {",
            "    int soma = 0;",
            "    for (int i = 1; i <= 100; i++) soma += i;",
            "    printf(\"Soma: %d\\n\", soma);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Calcula a soma dos números de 1 a 100."
        },
        {
          'codigo': [
            "int main() {",
            "    for (int i = 1; i <= 3; i++)",
            "        for (int j = 1; j <= 3; j++)",
            "            printf(\"(%d,%d) \", i, j);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Imprime pares (i, j) usando laços aninhados."
        }
      ],
      [
        {
          'codigo': [
            "int main() {",
            "    int num, fat = 1;",
            "    scanf(\"%d\", &num);",
            "    for (int i = 1; i <= num; i++) fat *= i;",
            "    printf(\"Fatorial: %d\\n\", fat);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Calcula o fatorial de um número."
        },
        {
          'codigo': [
            "int main() {",
            "    int num, primo = 1;",
            "    scanf(\"%d\", &num);",
            "    for (int i = 2; i <= num / 2; i++)",
            "        if (num % i == 0) primo = 0;",
            "    printf(\"%d\\n\", primo);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Verifica se um número é primo."
        },
        {
          'codigo': [
            "int main() {",
            "    int num, soma = 0;",
            "    do {",
            "        scanf(\"%d\", &num);",
            "        soma += num;",
            "    } while (num != 0);",
            "    printf(\"Soma: %d\\n\", soma);",
            "    return 0;",
            "}"
          ],
          'explicacao': "Soma números até que o usuário digite 0."
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
                            showCustomDialogWithoutParamsRepeticao(context);
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
