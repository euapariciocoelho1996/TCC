import 'package:flutter/material.dart';

/// Função para exibir um diálogo de resposta errada com efeito de zoom
Future<void> showWrongAnswerDialog({
  required BuildContext context,
  required VoidCallback onRetry,
  required String Function() getRandomWrongMessage,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Fechar",
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(200, 219, 73, 73),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0), // Cor da borda
                width: 3, // Espessura da borda
              ),
              borderRadius: BorderRadius.circular(10), // Bordas arredondadas
            ),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Errado!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  getRandomWrongMessage(),
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                    fontSize: 16,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o dialog
                    onRetry(); // Permitir ao usuário tentar novamente
                  },
                  child: const Text("Tentar Novamente"),
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
