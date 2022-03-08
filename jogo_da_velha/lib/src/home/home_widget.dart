import 'package:flutter/material.dart';
import 'package:jogo_da_velha/src/home/home_controller.dart';
import 'package:jogo_da_velha/src/home/widgets/item_tabuleiro.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    print('passou aqui');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da velha'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: _constroiLinha(0),
            ),
          ),
          Expanded(
            child: Container(
              child: _constroiLinha(1),
            ),
          ),
          Expanded(
            child: Container(
              child: _constroiLinha(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _constroiLinha(int indiceLinha) {
    return Row(
      children: [
        ItemTabuleiro(
            jogador: controller.obtemValorPosicao(indiceLinha, 0),
            onTap: () {
              setState(() {
                controller.jogar(indiceLinha, 0);
              });
            }),
        ItemTabuleiro(
            jogador: controller.obtemValorPosicao(indiceLinha, 1),
            onTap: () {
              setState(() {
                controller.jogar(indiceLinha, 1);
              });
            }),
        ItemTabuleiro(
            jogador: controller.obtemValorPosicao(indiceLinha, 2),
            onTap: () {
              setState(() {
                controller.jogar(indiceLinha, 2);
              });
            }),
      ],
    );
  }
}
