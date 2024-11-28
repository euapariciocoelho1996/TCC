import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  // Variáveis e métodos para o contador de pontos
  int _count = 900;
  int get count => _count;

  void increment() {
    _count += 100;
    notifyListeners(); // Notifica os ouvintes sobre a mudança de estado
  }

  // Variáveis e métodos para o sistema de vidas
  int _vidas = 5; // Número inicial de vidas
  final int _maxVidas = 5;

  int get vidas => _vidas;

  void perderVida() {
    if (_vidas > 0) {
      _vidas--;
      notifyListeners();
    }

    // Verifica se as vidas acabaram e, se sim, reinicia o jogo
    if (_vidas == 0) {
      resetGame();
    }
  }

  void ganharVida() {
    if (_vidas < _maxVidas) {
      _vidas++;
      notifyListeners();
    }
  }

  // Método para reiniciar o jogo
  void resetGame() {
    _vidas = _maxVidas;
    notifyListeners();
  }
}
