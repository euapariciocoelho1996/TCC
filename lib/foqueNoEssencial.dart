import 'package:flutter/material.dart';
import 'pages/algoritmos.dart';

class Foquenoessencial extends StatelessWidget {
  const Foquenoessencial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
      width: double.infinity,
      alignment: Alignment.topCenter,
      height: 210,
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Espaçamento igual entre os containers

        children: <Widget>[
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(237, 133, 59, 1),
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    4.0,
                    4.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: const Center(
              child: Text(
                'Praticar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(237, 133, 59, 1),
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    4.0,
                    4.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: const Center(
              child: Text(
                'Referências',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            // envolve container e torna-o como um botao, e personaliza com som
            onTap: () {
              // Ação quando o Container é pressionado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Algoritmos()));
            },
            child: Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 133, 59, 1),
                borderRadius: BorderRadius.circular(3),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      4.0,
                      4.0,
                    ),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: const Center(
                child: Text(
                  'Algoritmos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
