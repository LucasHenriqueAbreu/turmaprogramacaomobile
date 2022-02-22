import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  String descricao;
  
  ItemLista({required this.descricao});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(descricao),
    );
  }
}
