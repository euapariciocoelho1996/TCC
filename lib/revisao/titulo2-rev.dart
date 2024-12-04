import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTyperText extends StatelessWidget {
  const AnimatedTyperText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 19,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w900,
          shadows: [
            Shadow(
              blurRadius: 5,
              color: Colors.black,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('TESTE SUAS HABILIDADES!',
                speed: const Duration(milliseconds: 100)),
          ],
        ),
      ),
    );
  }
}
