import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: const Color.fromARGB(255, 0, 0, 0), // Cor da borda
            width: 1, // Largura da borda
          ),
          elevation: 10, backgroundColor: color, // Define a altura da sombra
          shadowColor: Colors.black.withOpacity(0.5), // Cor de fundo do botão
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15, color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
