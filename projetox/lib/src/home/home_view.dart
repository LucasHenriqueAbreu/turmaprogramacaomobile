import 'package:flutter/material.dart';
import 'package:projetox/src/home/detalhes_view.dart';
import 'package:projetox/src/home/menu/menu_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _buildHome(),
    );
  }

  Widget _buildHome() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: 100,
      itemBuilder: (context, index) => _buildItem(context, index),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detalhes',
            arguments: {'idProduto': index, 'urlFoto': 'https://picsum.photos/id/$index/200/300'},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: 'imagem$index',
                child: Image.network(
                  'https://picsum.photos/id/$index/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: Text('Produto $index'),
              subtitle: const Text('Loren impsum'),
            ),
          ],
        ),
      ),
    );
  }
}
