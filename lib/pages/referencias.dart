import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/pages/animacao-ref.dart';
import 'custom_card.dart'; // Importa o arquivo do widget reutilizável

class Referencias extends StatefulWidget {
  const Referencias({super.key});

  @override
  State<Referencias> createState() => _ReferenciasState();
}

class _ReferenciasState extends State<Referencias>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Começa fora da tela (abaixo)
      end: Offset.zero,              // Finaliza na posição original
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Inicia a animação
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera os recursos do controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Referências',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
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
        child: SlideTransition(
          position: _slideAnimation, // Aplica a animação ao container principal
          child: ListView(
            children: [
              Column(
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
                          color: Colors.white,
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
