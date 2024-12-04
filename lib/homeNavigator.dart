import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/main.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navegação para a página inicial
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  const MyApp()), // Altere 'Inicio()' para a página desejada
          (Route<dynamic> route) => false,
        );
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.home,
        color: const Color.fromRGBO(40, 23, 206, 1),
      ),
    );
  }
}
