import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Bubblesort extends StatelessWidget {
  const Bubblesort({super.key});

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
                  'Bubble Sort',
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
                    'Bubble Sort é um algoritmo de ordenação simples que organiza os elementos de uma lista ao comparar repetidamente pares adjacentes e trocar os elementos, se estiverem fora de ordem. O algoritmo funciona da seguinte maneira:\n\n'
                    '1. Comparação de Pares Adjacentes: O algoritmo percorre a lista comparando dois elementos adjacentes por vez.\n\n'
                    '2. Troca: Se os elementos comparados estiverem fora de ordem (o primeiro for maior que o segundo), eles são trocados de posição.\n\n'
                    '3. Iteração Completa: O processo é repetido para todos os pares da lista, "empurrando" o maior elemento para o final da lista.\n\n'
                    '4. Repetição: A iteração é repetida para o restante da lista, ignorando o último elemento a cada repetição, pois ele já estará ordenado. O processo continua até que não sejam necessárias mais trocas.',
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
                    'Comportamento do Bubble Sort',
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
                      'assets/images/bubble.gif',
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
