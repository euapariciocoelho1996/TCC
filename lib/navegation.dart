import 'package:flutter/material.dart';
import './pages/algoritmos.dart';
import 'appBar.dart';

class Navegacao extends StatefulWidget {
  const Navegacao({super.key});

  @override
  State<Navegacao> createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  int _selectedIndex = 0;

  // Lista de páginas que serão exibidas conforme a aba selecionada
  static final List<Widget> _pages = <Widget>[
    Algoritmos(), // Página inicial (Home)
    Center(child: Text('Página de Pesquisa')), // Página de Pesquisa
    Center(child: Text('Página de Perfil')), // Página de Perfil
  ];

  // Método para mudar de aba
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar('Nome Aplicativo'),
        body: _pages[_selectedIndex], // Exibe a página de acordo com a aba selecionada
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pesquisa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex, // Aba atualmente selecionada
          selectedItemColor: const Color.fromARGB(255, 243, 131, 33), // Cor do item selecionado
          onTap: _onItemTapped, // Chama o método ao tocar na aba
        ),
      ),
    );
  }
}
