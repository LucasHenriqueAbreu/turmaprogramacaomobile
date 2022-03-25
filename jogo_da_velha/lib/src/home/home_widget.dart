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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da velha'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Teste'),
          Expanded(child: _buildTabuleiro()),
          const Text('Teste'),
        ],
      ),
    );
  }

  Widget _buildTabuleiro() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.tabluleiroLength,
          itemBuilder: (context, index) => ItemTabuleiro(
            jogador: controller.getValorPoisicao(index),
            onTap: () {
              setState(() {
                controller.jogar(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
