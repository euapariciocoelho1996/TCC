import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Quicksort extends StatelessWidget {
  const Quicksort({super.key});

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
                  'Quick Sort',
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
                    'Quick Sort é um algoritmo de ordenação eficiente que segue o paradigma de divisão e conquista, escolhendo um elemento como pivô e reorganizando os elementos em torno dele. O algoritmo funciona da seguinte maneira:\n\n'
                    '1. Escolha do Pivô: Um elemento da lista é escolhido como pivô (geralmente o primeiro, o último ou um elemento aleatório).\n\n'
                    '2. Particionamento: Os elementos da lista são reorganizados de forma que os menores que o pivô fiquem à sua esquerda e os maiores à sua direita.\n\n'
                    '3. Ordenação Recursiva: O processo é repetido recursivamente para as sublistas à esquerda e à direita do pivô.\n\n'
                    '4. Repetição: Isso continua até que todas as sublistas tenham tamanho 1, resultando em uma lista completamente ordenada.',
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
              Column(
                children: [
                  const Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 255, 255, 255),
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Comportamento do Quick Sort',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(237, 133, 59, 1),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    thickness: 2,
                    color: Color.fromARGB(255, 255, 255, 255),
                    indent: 50,
                    endIndent: 50,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // GIF com borda
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(237, 133, 59, 1),
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/quick.gif',
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
