import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Gridview'),
      ),
      // backgroundColor: Colors.grey.shade300,
      body: _constroiGridViewExtentComBuilder(),
    );
  }

  Widget _constroiGridViewCount() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: _criaListaItens(),
    );
  }

  Widget _constroiGridViewExtent() {
    return GridView.extent(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(8),
      maxCrossAxisExtent: 500,
      children: _criaListaItens(),
    );
  }

  Widget _constroiGridViewCountComBuilder() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 100,
      itemBuilder: (context, index) => _criaItem(index),
    );
  }

  Widget _constroiGridViewExtentComBuilder() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => _criaItem(index),
    );
  }

  List<Widget> _criaListaItens() {
    return List.generate(9, (index) => _criaItem(index));
  }

  Widget _criaItem(int index) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    'https://picsum.photos/id/$index/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black45,
                    child: Text(
                      'Imagem $index',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20.0),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/$index/200/300'),
              ),
            ),
            title: Text('Teste $index'),
            subtitle: const Text('Aasdf asdf'),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Ação'),
              )
            ],
          )
        ],
      ),
    );
  }
}
