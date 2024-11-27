import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedEffectsDemo(),
    );
  }
}

class AnimatedEffectsDemo extends StatefulWidget {
  @override
  _AnimatedEffectsDemoState createState() => _AnimatedEffectsDemoState();
}

class _AnimatedEffectsDemoState extends State<AnimatedEffectsDemo> {
  bool _isAnimated = false;
  bool _scaleEffect = false;
  bool _slideEffect = false;
  bool _rotateEffect = false;
  bool _fadeEffect = false;
  bool _containerEffect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animation Effects')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fade In Effect
            AnimatedOpacity(
              opacity: _fadeEffect ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: AnimatedScale(
                scale: _scaleEffect ? 1.5 : 1.0,
                duration: Duration(seconds: 2),
                child: AnimatedSlide(
                  offset: _slideEffect ? Offset(0, 0) : Offset(1, 0),
                  duration: Duration(seconds: 2),
                  child: AnimatedRotation(
                    turns: _rotateEffect ? 1 : 0,
                    duration: Duration(seconds: 2),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: _containerEffect ? 200 : 100,
                      width: _containerEffect ? 200 : 100,
                      color: _containerEffect ? Colors.blue : Colors.red,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _fadeEffect = true;
                              _scaleEffect = true;
                              _slideEffect = true;
                              _rotateEffect = true;
                              _containerEffect = true;
                            });
                          },
                          child: Text(
                            'Tap to Animate',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            // Lottie Animation (Example: Lottie file must be added to your project)
            Lottie.asset('assets/animation.json', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
