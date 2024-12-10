// messages.dart
import 'dart:math';

final List<String> correctMessages = [
  'Parabéns! Você acertou!',
  'Muito bem! Resposta correta!',
  'Excelente! Resposta certa!',
  'Ótimo trabalho! Você acertou!'
];

final List<String> wrongMessages = [
  'Ops! Tente novamente!',
  'Que pena! Resposta errada!',
  'Não foi dessa vez! Tente de novo!',
  'Hmmm... resposta incorreta, tente outra vez!'
];

// Função para obter uma mensagem aleatória de acerto
String getRandomCorrectMessage() {
  final random = Random();
  return correctMessages[random.nextInt(correctMessages.length)];
}

// Função para obter uma mensagem aleatória de erro
String getRandomWrongMessage() {
  final random = Random();
  return wrongMessages[random.nextInt(wrongMessages.length)];
}
