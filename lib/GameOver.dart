import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:provider/provider.dart';

class Gameover {
  // Função para exibir o Game Over com efeito de zoom
  static void mostrarGameOver(BuildContext context) {
    final vidas = Provider.of<Counter>(context, listen: false);

    vidas.resetGame();

    showGeneralDialog(
      context: context,
      barrierDismissible: false, // Impede que o alerta seja fechado ao tocar fora
      barrierLabel: "Fechar",
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            borderRadius: BorderRadius.circular(15), // Bordas arredondadas
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Você perdeu todas as suas vidas!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                      // Substituir '/main' pelo nome correto da tela principal
                    },
                    child: const Text('Voltar para a tela principal'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      },
    );
  }
}
