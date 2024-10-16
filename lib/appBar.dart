import 'package:flutter/material.dart';

// Função que retorna a AppBar
AppBar customAppBar(String title) {
  return AppBar(
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
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
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 14, // Define o tamanho da fonte do título
        fontWeight: FontWeight.normal, // Define o peso da fonte
      ),
    ),
    centerTitle: true, // Centraliza o título
    backgroundColor: const Color.fromRGBO(250, 227, 105, 1), // Cor da AppBar
  );
}
