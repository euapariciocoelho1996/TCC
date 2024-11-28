import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';

import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages


class VidaCoracoes extends StatefulWidget {
  const VidaCoracoes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VidaCoracoesState createState() => _VidaCoracoesState();
}

class _VidaCoracoesState extends State<VidaCoracoes> {
  

  @override
  Widget build(BuildContext context) {
    final vidas = Provider.of<Counter>(context, listen: false).vidas;

    return Column(
      children: [
        Container(
          width: 600,
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(5, (index) {
              return Icon(
                index < vidas ? Icons.favorite : Icons.favorite_border,
                color: index < vidas ? Colors.red : Colors.grey,
                size: 30.0,
              );
            }),
          ),
        ),
      ],
    );
  }
}
