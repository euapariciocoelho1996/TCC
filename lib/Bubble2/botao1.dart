import 'package:flutter/material.dart';

class Botao1 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // onPressed é opcional agora
  final Color color;

  const Botao1({
    Key? key,
    required this.text,
    this.onPressed, // Deixe onPressed como opcional
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {}, // Se onPressed for null, não faz nada
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Usa a cor recebida como parâmetro
        foregroundColor: Colors.white, // Cor do texto
        elevation: 5,
        shadowColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
