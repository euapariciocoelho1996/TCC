// dialog_helper.dart
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void showCorrectAnswerDialog(BuildContext context, String correctAnswer, String explanation, ConfettiController confettiController) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Resposta Correta!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              'Resposta correta: $correctAnswer',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Explicação: $explanation',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 24.0,
        actions: <Widget>[
          TextButton(
            child: const Text('Fechar'),
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o dialog
              confettiController.play(); // Toca o confete
            },
          ),
        ],
      );
    },
  );
}
