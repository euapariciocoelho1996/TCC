import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/revisao/inicio.dart';

class ButtonRevisao extends StatelessWidget {
  const ButtonRevisao({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const RevisaoInicio()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Fundo transparente
          side: BorderSide(color: Colors.white, width: 2), // Bordas brancas
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        ),
        child: const Text(
          'Revisar o básico',
          style: TextStyle(
            color: Colors.white, // Texto branco
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
