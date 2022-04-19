import 'package:ecommerce/controllers/carrinho_compras_controller.dart';
import 'package:ecommerce/models/produto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve iniciar os produtos de forma vazia', () {
    final controller = CarrinhoComprasController();
    expect(controller.produtos.length, 0);
  });

  test('Deve conter um produto na lista após a execução do método add', () {
    final controller = CarrinhoComprasController();
    controller.addListener(() {
      expect(controller.produtos.length, 1);
    });
    final produto = Produto(id: 1, nome: 'Produto 1', valor: 50.0);
    controller.add(produto);
  });

  test('Deve ter um valor total de 50.0 quando o produto for adicionado', () {
    final controller = CarrinhoComprasController();
    controller.addListener(() {
      expect(controller.valorTotalVenda, 50.0);
    });
    final produto = Produto(id: 1, nome: 'Produto 1', valor: 50.0);
    controller.add(produto);
  });

  test(
      'Deve ter um valor total incial igual a zero e quando adicionar o produto novo, o valor deve ser maior que o valor inicial',
      () {
    final controller = CarrinhoComprasController();
    final valorInical = controller.valorTotalVenda;
    expect(valorInical, 0);
    controller.addListener(() {
      expect(controller.valorTotalVenda, greaterThan(valorInical));
    });
    final produto = Produto(id: 1, nome: 'Produto 1', valor: 50.0);
    controller.add(produto);
  });


  test('Deve ter um valor total de 50.0 quando o produto for adicionado', () {
    final controller = CarrinhoComprasController();
    final produto = Produto(id: 1, nome: 'Produto 1', valor: 50.0);
    controller.add(produto);
    expect(controller.produtos.length, 1);
    
    controller.addListener(() {
      expect(controller.produtos.length, 0);
    });

    controller.removeAll();
  });
}
