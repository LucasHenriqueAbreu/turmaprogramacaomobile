import 'dart:collection';

import 'package:ecommerce/models/produto_model.dart';
import 'package:flutter/widgets.dart';

class CarrinhoComprasController extends ChangeNotifier {
  final List<Produto> _produtos = [];

  UnmodifiableListView<Produto> get produtos => UnmodifiableListView(_produtos);

  double get valorTotalVenda => _produtos.fold(
      0, (previousValue, produto) => previousValue + produto.valor);

  void add(Produto produto) {
    _produtos.add(produto);
    notifyListeners();
  }

  void removeAll() {
    _produtos.clear();
    notifyListeners();
  }
}
