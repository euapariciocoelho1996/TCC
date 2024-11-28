import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/pages/animacao-ref.dart';
import 'custom_card.dart'; // Importa o arquivo do widget reutilizável

class Referencias extends StatelessWidget {
  const Referencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Referências',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, // Cor dos ícones
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.png"), // Imagem de fundo
            fit: BoxFit.cover, // Ajusta a imagem ao tamanho do Drawer
          ),
        ),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  // Título principal
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        'Livros recomendados!!',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  // Adicionando a animação com um tamanho fixo para o Stack
                  SizedBox(
                    width: double.infinity, // Largura completa
                    height: 100, // Defina a altura conforme necessário
                    child: AnimatedHeart(), // O widget que realiza a animação
                  ),

                  // Cards de livros
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: CustomCard(
                      imagePath: 'assets/images/livro1.jpg',
                      title: 'C: Como Programar',
                      description:
                          'Excelente introdução à linguagem C, com exemplos claros e práticos.',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CustomCard(
                      imagePath: 'assets/images/livro2.jpg',
                      title: 'C: Completo e Total',
                      description:
                          'Uma obra completa, oferecendo informações únicas sobre a linguagem.',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CustomCard(
                      imagePath: 'assets/images/livro3.jpg',
                      title:
                          'Entendendo Algoritmos: Um Guia Ilustrado Para Programadores e Outros Curiosos',
                      description:
                          'Ideal para programadores que buscam aprender algoritmos de maneira acessível e aplicável.',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
