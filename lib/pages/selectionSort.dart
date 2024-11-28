import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Selectionsort extends StatefulWidget {
  const Selectionsort({super.key});

  @override
  State<Selectionsort> createState() => _SelectionsortState();
}

class _SelectionsortState extends State<Selectionsort>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Começa fora da tela (abaixo)
      end: Offset.zero, // Finaliza na posição original
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward(); // Inicia a animação
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera os recursos do controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: customAppBar('Nome Aplicativo'),
      body: SlideTransition(
        position: _slideAnimation, // Aplica a animação ao container principal
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/1.png"), // Imagem de fundo
              fit: BoxFit.cover, // Ajusta a imagem ao tamanho do Drawer
            ),
          ),
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                const Center(
                  child: Text(
                    'Selection Sort',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(237, 133, 59, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Descrição
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Selection Sort é um algoritmo de ordenação simples que organiza os elementos de uma lista ao dividir a lista em duas partes: a parte ordenada e a parte não ordenada. O algoritmo funciona da seguinte maneira:\n\n'
                      '1. Divisão da Lista: A lista é inicialmente considerada toda não ordenada.\n\n'
                      '2. Iteração: O algoritmo percorre toda a parte não ordenada da lista para encontrar o menor (ou maior) elemento.\n\n'
                      '3. Troca: Após identificar o menor elemento, ele é trocado com o primeiro elemento da parte não ordenada, movendo-o para a parte ordenada.\n\n'
                      '4. Repetição: O processo é repetido para o restante da lista, cada vez reduzindo a parte não ordenada.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        height: 1.5, // Melhor espaçamento entre linhas
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Comportamento do algoritmo
                Column(
                  children: [
                    const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 255, 255, 255),
                      indent: 50,
                      endIndent: 50,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Comportamento do Selection Sort',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(237, 133, 59, 1),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 255, 255, 255),
                      indent: 50,
                      endIndent: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // GIF com borda
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(237, 133, 59, 1),
                        width: 4.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/selection.gif',
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
