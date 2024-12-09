import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  // Para incluir conteúdos sobre o fundo
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/1.png"), // Imagem de fundo
          fit: BoxFit.cover, // Ajusta a imagem ao tamanho
        ),
      ),
      // Permite adicionar outros widgets
    );
  }
}
