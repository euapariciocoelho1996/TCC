// animated_heart.dart
import 'package:flutter/material.dart';

class AnimatedHeart extends StatefulWidget {
  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0), // posição inicial
      end: Offset(0, 0.2), // posição final
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Linha amarela
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(20, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 10,
                  height: 10,
                  color: index % 2 == 0 ? Colors.yellow : Colors.transparent,
                ),
              );
            }),
          ),
        ),

        // Coração animado
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              top: 30 + _offsetAnimation.value.dy * 100, // Movendo o coração
              left: MediaQuery.of(context).size.width / 2 -
                  20, // Centralizando horizontalmente
              child: Icon(
                Icons.favorite,
                size: 40,
                color: Colors.pink,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
