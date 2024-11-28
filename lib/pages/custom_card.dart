import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath; // Caminho da imagem
  final String title; // Título do card
  final String description; // Descrição do card
  final double height; // Altura do card
  final double imageWidth; // Largura da imagem
  final double imageHeight; // Altura da imagem

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.height = 200,
    this.imageWidth = 130,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Altura do card
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Foto (lado esquerdo)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath, // Caminho da imagem
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10), // Espaço entre foto e texto

              // Informações (lado direito)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3, // Limita as linhas do texto
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
