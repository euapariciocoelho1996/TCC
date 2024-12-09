import 'package:flutter/material.dart';
import 'custom_button.dart'; // Importe CustomButton caso esteja em outro arquivo

class QuestionWidget extends StatelessWidget {
  final Map<String, Object> currentQuestion;
  final bool? isAnswerCorrect;
  final Function(bool) checkAnswer;

  const QuestionWidget({
    Key? key,
    required this.currentQuestion,
    required this.isAnswerCorrect,
    required this.checkAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentQuestion['questionText'] as String,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(
                  255, 0, 0, 0), // Cor da borda
              width: 1, // Largura da borda
            ),
            borderRadius: BorderRadius.circular(
                10), // Bordas arredondadas (opcional)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                10), // Aplicar o mesmo arredondamento
            child: Image.asset(
              currentQuestion['image'] as String,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...(currentQuestion['answers']
                as List<Map<String, Object>>)
            .map(
          (answer) {
            Color buttonColor;
            if (isAnswerCorrect == null) {
              buttonColor =
                  const Color.fromARGB(255, 224, 131, 9);
            } else if (answer['isCorrect'] ==
                isAnswerCorrect) {
              buttonColor = isAnswerCorrect!
                  ? Colors.green
                  : Colors.red;
            } else {
              buttonColor =
                  const Color.fromARGB(255, 255, 255, 255);
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0),
              child: CustomButton(
                text: answer['text'] as String,
                color: buttonColor,
                onPressed: isAnswerCorrect == null
                    ? () => checkAnswer(
                        answer['isCorrect'] as bool)
                    : null,
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
