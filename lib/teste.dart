import 'package:flutter/material.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Importar o pacote

class AutoSlideMessages extends StatefulWidget {
  const AutoSlideMessages({super.key});

  @override
  _AutoSlideMessagesState createState() => _AutoSlideMessagesState();
}

class _AutoSlideMessagesState extends State<AutoSlideMessages> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> messages = [
    "Bem-vindo ao nosso aplicativo!",
    "Aprenda algo novo todos os dias.",
    "Explore diferentes algoritmos de ordenação com facilidade.",
    "Melhore suas habilidades de programação.",
    "Obrigado por usar nosso aplicativo!",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Configura o timer para alternar as mensagens
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < messages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Volta ao início
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200, // Altura do container
              width: 390,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      messages[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20), // Espaço entre o slider e os pontos
            // Pontinhos para indicar o slide atual
            SmoothPageIndicator(
              controller: _pageController,
              count: messages.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 4,
                spacing: 16,
                dotColor: Colors.grey,
                activeDotColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
