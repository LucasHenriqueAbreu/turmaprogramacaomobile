import 'package:badges/badges.dart';
import 'package:ecommerce/controllers/carrinho_compras_controller.dart';
import 'package:ecommerce/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Produto> _produtos = [
    Produto(id: 1, nome: 'Produto 1', valor: 10.32),
    Produto(id: 2, nome: 'Produto 2', valor: 12.32),
    Produto(id: 3, nome: 'Produto 3', valor: 13.32),
    Produto(id: 4, nome: 'Produto 4', valor: 14.32),
    Produto(id: 5, nome: 'Produto 5', valor: 15.32),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-commerce'),
        actions: [
          IconButton(
            onPressed: () {
              print('Vai direcionar para a view do carrinho');
            },
            icon: _constroiIconeCarrinhoCompras(),
          )
        ],
      ),
      body: _criaListaProdutos(),
    );
  }

  Widget _criaListaProdutos() {
    return ListView.builder(
      itemCount: _produtos.length,
      itemBuilder: (context, index) {
        final produto = _produtos[index];
        return ListTile(
          title: Text(produto.nome),
          subtitle: Text('${produto.valor}'),
          onTap: () {
            Provider.of<CarrinhoComprasController>(
              context,
              listen: false,
            ).add(produto);
          },
        );
      },
    );
  }

  Widget _constroiIconeCarrinhoCompras() {
    return Consumer<CarrinhoComprasController>(
      builder: (context, controller, _) {
        print('Passou aqui');
        return Badge(
          toAnimate: false,
          badgeContent: Text('${controller.produtos.length}'),
          child: const Icon(Icons.shopping_cart),
        );
      },
    );
  }
}
