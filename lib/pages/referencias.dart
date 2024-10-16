import 'package:flutter/material.dart';
import 'package:projeto_tcc_flutter/appBar.dart';
import 'package:projeto_tcc_flutter/homeNavigator.dart';

class Referencias extends StatelessWidget {
  const Referencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: customAppBar('Nome Aplicativo'),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                width: 383,
                height: 173,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 248, 248, 248),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 210,
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset('assets/images/camadas.png'),
                    ),
                    Container(
                        width: 170,
                        alignment: Alignment.center,
                        height: 200,
                        margin: const EdgeInsets.only(right: 30),
                        child: const Text(
                          'Fontes de conhecimento!',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                width: 388,
                height: 107,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 227, 105, 37),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
