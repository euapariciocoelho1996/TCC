import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart'; // Escolha um tema.

class CodeSnippet extends StatelessWidget {
  final String code; // Código a ser exibido
  final String language; // Linguagem do código
  final EdgeInsets padding; // Espaçamento interno
  final BoxDecoration? decoration; // Personalização de estilo do container

  const CodeSnippet({
    Key? key,
    required this.code,
    this.language = 'C', // Linguagem padrão é Dart
    this.padding = const EdgeInsets.all(16),
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: decoration ??
          BoxDecoration(
            color: Colors.grey[900], // Fundo escuro para o código
            borderRadius: BorderRadius.circular(8),
          ),
      padding: padding,
      child: HighlightView(
        code,
        language: language, // Linguagem do código (Dart, C, Python, etc.)
        theme: monokaiSublimeTheme, // Tema de syntax highlighting
        textStyle: const TextStyle(
          fontFamily: 'RobotoMono', // Fonte monoespaçada
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
