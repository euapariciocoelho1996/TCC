import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:projeto_tcc_flutter/ShowDialog.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';
import 'package:projeto_tcc_flutter/revisao/titulo-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo2-rev.dart';
import 'package:projeto_tcc_flutter/revisao/titulo3-rev.dart';
import 'package:projeto_tcc_flutter/revisao/vetor/vetor-alert.dart';
import 'dart:math';

import 'package:projeto_tcc_flutter/t.dart';

void main() => runApp(CodigoCAppVetor());

class CodigoCAppVetor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SelecionarNivelVetor(),
    );
  }
}

// Tela de seleção de nível
class SelecionarNivelVetor extends StatelessWidget {
  const SelecionarNivelVetor({super.key});

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
                  'Vetores',
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
            "void imprimeVetor(int v[], int tamanho) {",
            "    for (int i = 0; i < tamanho; i++)",
            "        printf(\"%d \", v[i]);",
            "    printf(\"\\n\");",
            "}",
            "int main() { int v[3] = {1, 2, 3}; imprimeVetor(v, 3); }"
          ],
          'explicacao': "Função que imprime todos os elementos de um vetor."
        },
        {
          'codigo': [
            "int somaVetor(int v[], int tamanho) {",
            "    int soma = 0;",
            "    for (int i = 0; i < tamanho; i++)",
            "        soma += v[i];",
            "    return soma;",
            "}",
            "int main() { int v[3] = {4, 7, 1}; printf(\"Soma: %d\\n\", somaVetor(v, 3)); }"
          ],
          'explicacao': "Função que calcula a soma dos elementos de um vetor."
        },
        {
          'codigo': [
            "void copiaVetor(int origem[], int destino[], int tamanho) {",
            "    for (int i = 0; i < tamanho; i++)",
            "        destino[i] = origem[i];",
            "}",
            "int main() { int v1[3] = {1, 2, 3}, v2[3];",
            "    copiaVetor(v1, v2, 3); }"
          ],
          'explicacao': "Função que copia os elementos de um vetor para outro."
        }
      ],
      [
        {
          'codigo': [
            "int buscaValor(int v[], int tamanho, int valor) {",
            "    for (int i = 0; i < tamanho; i++)",
            "        if (v[i] == valor) return i;",
            "    return -1;",
            "}",
            "int main() { int v[4] = {10, 20, 30, 40};",
            "    printf(\"Índice: %d\\n\", buscaValor(v, 4, 30)); }"
          ],
          'explicacao':
              "Função que busca um valor no vetor e retorna seu índice."
        },
        {
          'codigo': [
            "void ordenaVetor(int v[], int tamanho) {",
            "    for (int i = 0; i < tamanho - 1; i++)",
            "        for (int j = 0; j < tamanho - i - 1; j++)",
            "            if (v[j] > v[j + 1]) {",
            "                int temp = v[j]; v[j] = v[j + 1]; v[j + 1] = temp;",
            "            }",
            "}",
            "int main() { int v[3] = {3, 1, 2}; ordenaVetor(v, 3);"
          ],
          'explicacao':
              "Função que ordena os elementos do vetor em ordem crescente."
        },
        {
          'codigo': [
            "void inverteVetor(int v[], int tamanho) {",
            "    for (int i = 0; i < tamanho / 2; i++) {",
            "        int temp = v[i]; v[i] = v[tamanho - i - 1];",
            "        v[tamanho - i - 1] = temp;",
            "    }",
            "}",
            "int main() { int v[3] = {1, 2, 3}; inverteVetor(v, 3); }"
          ],
          'explicacao': "Função que inverte a ordem dos elementos de um vetor."
        }
      ],
      [
        {
          'codigo': [
            "double mediaVetor(int v[], int tamanho) {",
            "    int soma = 0;",
            "    for (int i = 0; i < tamanho; i++)",
            "        soma += v[i];",
            "    return (double)soma / tamanho;",
            "}",
            "int main() { int v[3] = {6, 7, 8};",
            "    printf(\"Média: %.2f\\n\", mediaVetor(v, 3)); }"
          ],
          'explicacao': "Função que calcula a média dos elementos de um vetor."
        },
        {
          'codigo': [
            "int encontraMaior(int v[], int tamanho) {",
            "    int maior = v[0];",
            "    for (int i = 1; i < tamanho; i++)",
            "        if (v[i] > maior) maior = v[i];",
            "    return maior;",
            "}",
            "int main() { int v[3] = {3, 7, 1};",
            "    printf(\"Maior: %d\\n\", encontraMaior(v, 3)); }"
          ],
          'explicacao': "Função que retorna o maior valor em um vetor."
        },
        {
          'codigo': [
            "int contaOcorrencias(int v[], int tamanho, int valor) {",
            "    int contador = 0;",
            "    for (int i = 0; i < tamanho; i++)",
            "        if (v[i] == valor) contador++;",
            "    return contador;",
            "}",
            "int main() { int v[4] = {2, 3, 2, 2};",
            "    printf(\"Ocorrências: %d\\n\", contaOcorrencias(v, 4, 2)); }"
          ],
          'explicacao':
              "Função que conta as ocorrências de um valor em um vetor."
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
                  const SizedBox(height: 7),
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
                                vertical: 2, horizontal: 16),
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
                                  fontSize: 14,
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
                            showCustomDialogWithoutParamsVetor(context);
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
