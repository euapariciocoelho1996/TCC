import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';

import 'package:provider/provider.dart';


class StarRatingI extends StatelessWidget {
  const StarRatingI({super.key});

  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Counter>(context).count;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Star(
          filled: score >= 2100,
          size: 50,
        ),
        SizedBox(width: 10),
        Transform.translate(
          offset: Offset(0, -10), // Aplicando o offset de -10
          child: Star(
            filled: score >= 2500,
            size: 70, // Estrela do meio mais alta
          ),
        ),
        SizedBox(width: 10),
        Star(
          filled: score >= 2900,
          size: 50,
        ),
      ],
    );
  }
}

class Star extends StatelessWidget {
  final bool filled;
  final double size;

  const Star({super.key, required this.filled, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      filled ? Icons.star : Icons.star_border,
      color: Colors.amber,
      size: 30, // Corrigido para usar o tamanho passado
    );
  }
}
