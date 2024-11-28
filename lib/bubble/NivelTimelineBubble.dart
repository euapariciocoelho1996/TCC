import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/bubble/bubble1.dart';
import 'package:projeto_tcc_flutter/bubble/bubble2.dart';
import 'package:projeto_tcc_flutter/bubble/bubble3.dart';
import 'package:projeto_tcc_flutter/ensino/bubble/b-ensino1.dart';

import 'package:provider/provider.dart';


class BubbleN extends StatelessWidget {
  const BubbleN({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Alinha tudo no centro verticalmente
            children: [
              Container(
                width: 120,
                height: 1,
                color: Colors.grey,
              ),
              const Text(
                'Bubble Sort',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 120,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        // ENSINO
        InkWell(
          onTap: () {
            // Navega para QuizScreenBubble1 ao tocar
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BubbleSortIntroduction(),
              ),
            );
          },
          child: Container(
            width: 340,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber, // Cor definida pelo contador
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Teoria', // Exibe o valor 1
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  // Define a cor com base no valor do contador
                  // a primeira fase sempre fica disponivel
                  final Color containerColor =
                      counter.count < 300 ? Colors.blue : Colors.green;

                  return InkWell(
                    onTap: () {
                      // Navega para QuizScreenBubble1 ao tocar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreenBubble1(),
                        ),
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: containerColor, // Cor definida pelo contador
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '1', // Exibe o valor 1
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  final Color containerColor;
                  if (counter.count < 300) {
                    containerColor = Colors.grey;
                  } else {
                    containerColor =
                        counter.count < 600 ? Colors.blue : Colors.green;
                  }
                  // Define a cor com base no valor do contador

                  return InkWell(
                    onTap: counter.count >= 300
                        ? () {
                            // Navega para QuizScreenBubble3 ao tocar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuizScreenBubble2(),
                              ),
                            );
                          }
                        : null,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: containerColor, // Cor definida pelo contador
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '2', // Exibe o valor 2
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  // Define a cor com base no valor do contador
                  final Color containerColor;
                  if (counter.count < 600) {
                    containerColor = Colors.grey;
                  } else {
                    containerColor =
                        counter.count < 900 ? Colors.blue : Colors.green;
                  }

                  return InkWell(
                    onTap: counter.count >= 600
                        ? () {
                            // Navega para QuizScreenBubble3 ao tocar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuizScreenBubble3(),
                              ),
                            );
                          }
                        : null,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: containerColor, // Cor definida pelo contador
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '3', // Exibe o valor 2
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
