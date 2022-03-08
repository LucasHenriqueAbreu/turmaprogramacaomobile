import 'package:flutter/material.dart';

class ItemTabuleiro extends StatelessWidget {
  final Function()? onTap;
  final int jogador;

  ItemTabuleiro({required this.jogador, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          color: Colors.orange,
          child: Center(
            child: Text(jogador.toString()),
          ),
        ),
      ),
    );
  }
}
