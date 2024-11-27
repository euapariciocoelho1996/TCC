import 'package:flutter/material.dart';

// Função que retorna a AppBar
AppBar customAppBar(String title) {
  return AppBar(
    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {
          // Ação ao clicar no ícone de notificações
        },
      ),
    ],
    title: Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 14, // Define o tamanho da fonte do título
        fontWeight: FontWeight.normal, // Define o peso da fonte
      ),
    ),
    centerTitle: true, // Centraliza o título
    backgroundColor: Colors.black, // Cor da AppBar
  );
}
