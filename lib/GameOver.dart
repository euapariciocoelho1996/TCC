import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';

import 'package:provider/provider.dart';


class Gameover {
  // Função para exibir o Game Over
  static void mostrarGameOver(BuildContext context) {
    final vidas = Provider.of<Counter>(context, listen: false);

    vidas.resetGame();

    showDialog(
      context: context,
      barrierDismissible:
          false, // Impede que o alerta seja fechado ao tocar fora
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Você perdeu todas as suas vidas!'),
          actions: [
            TextButton(
              onPressed: () {
                // Ação para ir para a tela principal
                Navigator.pushReplacementNamed(context, '/main');
                // Aqui você pode substituir '/main' pelo nome da sua tela principal
              },
              child: Text('Voltar para a tela principal'),
            ),
          ],
        );
      },
    );
  }
}
