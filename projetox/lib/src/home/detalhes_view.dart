import 'package:flutter/material.dart';

class DetalhesView extends StatelessWidget {
  final int idProduto;
  final String urlFoto;

  DetalhesView({
    required this.idProduto,
    required this.urlFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do produto'),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'imagem$idProduto',
                child: CircleAvatar(
                  child: Image.network( 
                    urlFoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: Text('Produto $idProduto'),
              subtitle: const Text('Loren impsum'),
            ),
          ],
        ),
      ),
    );
  }
}
