import 'package:flutter/material.dart';

class ItemTabuleiro extends StatelessWidget {
  final Function()? onTap;
  final int jogador;

  ItemTabuleiro({required this.jogador, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.orange,
        child: Center(
          child: Text(jogador.toString()),
        ),
      ),
    );
  }
}
