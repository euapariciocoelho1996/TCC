import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/ProviderCounter.dart';
import 'package:projeto_tcc_flutter/ensino/selection/s-ensino1.dart';
import 'package:projeto_tcc_flutter/selection/selection1.dart';
import 'package:projeto_tcc_flutter/selection/selection2.dart';
import 'package:projeto_tcc_flutter/selection/selection3.dart';

import 'package:provider/provider.dart';


class SelectionN extends StatelessWidget {
  const SelectionN({super.key});

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
                'Selection Sort',
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
        InkWell(
          onTap: () {
            // Navega para QuizScreenBubble1 ao tocar
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectionSortIntroduction(),
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
                  final Color containerColor;
                  if (counter.count < 900) {
                    containerColor = Colors.grey;
                  } else {
                    containerColor =
                        counter.count < 1200 ? Colors.blue : Colors.green;
                  }
                  // Define a cor com base no valor do contador

                  return InkWell(
                    onTap: counter.count >= 900
                        ? () {
                            // Navega para QuizScreenBubble3 ao tocar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuizScreenSelection1(),
                              ),
                            );
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: containerColor, // Cor definida pelo contador
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '1', // Exibe o valor 2
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  final Color containerColor;
                  if (counter.count < 1200) {
                    containerColor = Colors.grey;
                  } else {
                    containerColor =
                        counter.count < 1500 ? Colors.blue : Colors.green;
                  }
                  // Define a cor com base no valor do contador

                  return InkWell(
                    onTap: counter.count >= 1200
                        ? () {
                            // Navega para QuizScreenBubble3 ao tocar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuizScreenSelection2(),
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
                  if (counter.count < 1500) {
                    containerColor = Colors.grey;
                  } else {
                    containerColor =
                        counter.count < 1800 ? Colors.blue : Colors.green;
                  }

                  return InkWell(
                    onTap: counter.count >= 1500
                        ? () {
                            // Navega para QuizScreenBubble3 ao tocar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuizScreenSelection3(),
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
