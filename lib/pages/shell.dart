import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Shellsort extends StatelessWidget {
  const Shellsort({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar('Nome Aplicativo'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.png"), // Imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho do Drawer
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              const Center(
                child: Text(
                  'Shell Sort',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(237, 133, 59, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Descrição
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Shell Sort é um algoritmo de ordenação eficiente baseado no conceito de inserção. Sua principal ideia é diminuir a quantidade de movimentações ao ordenar elementos distantes entre si e, gradualmente, diminuir a distância entre os elementos a serem comparados até que o algoritmo se torne equivalente a uma ordenação por inserção simples. O algoritmo funciona da seguinte maneira:\n\n'
                    '1. Escolha de um Gap: Um valor de gap é selecionado, representando a distância entre os elementos a serem comparados.\n\n'
                    '2. Comparação e Troca: Os elementos que estão distantes pela distância definida pelo gap são comparados e trocados se necessário.\n\n'
                    '3. Redução do Gap: O gap é reduzido progressivamente até que o valor seja 1, momento em que o algoritmo se torna um simples algoritmo de inserção.\n\n'
                    '4. Ordenação Final: Com a redução do gap, o algoritmo começa a ordenar a lista de maneira mais eficiente até que todos os elementos estejam ordenados.\n\n'
                    'Exemplo prático (com a lista [4, 10, 2, 1]):\n\n'
                    '1. Inicialmente, escolhemos um valor de gap (supondo que o gap inicial seja 2, metade do tamanho da lista).\n'
                    '   - Lista inicial: [4, 10, 2, 1]\n'
                    '2. Comparamos os elementos distantes por 2 posições: (4 com 2) e (10 com 1).\n'
                    '   - Troca 4 e 2: [2, 10, 4, 1]\n'
                    '   - Troca 10 e 1: [2, 1, 4, 10]\n'
                    '3. O gap é reduzido para 1, e o algoritmo começa a funcionar como uma ordenação por inserção.\n'
                    '   - Compara 2 e 1, trocando-os: [1, 2, 4, 10]\n'
                    '4. A lista final ordenada é: [1, 2, 4, 10]',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      height: 1.5, // Melhor espaçamento entre linhas
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Comportamento do algoritmo

              // GIF com borda
            ],
          ),
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
