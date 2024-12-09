import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class AnimatedFlipper extends StatefulWidget {
  const AnimatedFlipper({super.key});

  @override
  State<AnimatedFlipper> createState() => _AnimatedFlipperState();
}

class _AnimatedFlipperState extends State<AnimatedFlipper> {
  late Stream<int> _valueStream;
  int _previousValue = 0; // Armazena o valor anterior
  int _displayedValue = 0; // Valor atualmente exibido

  @override
  void initState() {
    super.initState();
    _valueStream =
        Stream.periodic(const Duration(seconds: 2), (count) => count);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _valueStream,
      initialData: 0,
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;

        // Apenas atualiza o valor exibido se o valor atual for maior
        if (value > _previousValue) {
          _displayedValue = value;
        }

        _previousValue = value; // Atualiza o valor anterior

        return AnimatedFlipCounter(
          value: _displayedValue,
          fractionDigits: 2,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          textStyle: TextStyle(
            fontSize: 40,
            color: _displayedValue >= 0 ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }
}
