import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required ConfettiController confettiController,
  String buttonText = "Continuar",
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Fechar",
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Stack(
        children: [
          // Confete
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
          // ShowDialog
          Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(40, 23, 206, 1),
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
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      message,
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
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(buttonText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
