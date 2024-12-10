import 'package:flutter/material.dart';

/// Função para exibir um diálogo de resposta correta com efeito de zoom
Future<void> showCorrectAnswerDialog({
  required BuildContext context,
  required String correctMessage,
  required String explanation,
  String? textoBotao,
  // tornei opcional caso der erro voltar para required
  VoidCallback? onNextQuestion,
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
              color: const Color.fromARGB(255, 23, 206, 136),
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
                  'Correto!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$correctMessage\n\n$explanation',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                    onNextQuestion!(); // Avança para a próxima pergunta
                  },
                  child: Text(textoBotao ?? 'Continuar'),
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
