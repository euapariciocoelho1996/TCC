import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose(); // Limpa recursos ao sair
    super.dispose();
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource('assets/audio/win-1.mp3')); // Reproduz o arquivo local
  }

  Future<void> _pauseMusic() async {
    await _audioPlayer.pause();
  }

  Future<void> _stopMusic() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Player de Música')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _playMusic,
              child: Text('Tocar Música'),
            ),
            ElevatedButton(
              onPressed: _pauseMusic,
              child: Text('Pausar Música'),
            ),
            ElevatedButton(
              onPressed: _stopMusic,
              child: Text('Parar Música'),
            ),
          ],
        ),
      ),
    );
  }
}
