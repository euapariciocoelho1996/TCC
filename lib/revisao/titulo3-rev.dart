import 'package:flutter/material.dart';

class ZoomWidget extends StatefulWidget {
  final Widget child;

  const ZoomWidget({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _ZoomWidgetState createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define uma animação de zoom entre 1x e 2x
    _zoomAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Inicia a animação de zoom
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _zoomAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _zoomAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}
