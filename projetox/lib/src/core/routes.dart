import 'package:flutter/material.dart';
import 'package:projetox/src/home/detalhes_view.dart';
import 'package:projetox/src/home/home_view.dart';
import 'package:projetox/src/home/one_view.dart';
import 'package:projetox/src/home/tree_view.dart';
import 'package:projetox/src/home/two_view.dart';
import 'package:projetox/src/login/login_view.dart';

class CustomRoutes {
  static Route? onGeneratedRoute(RouteSettings settings) {
    var rota = settings.name;
    late Widget view;
    switch (rota) {
      case '/':
        view = LoginView();
        break;
      case '/home':
        view = HomeView();
        break;
      case '/one':
        view = OneView();
        break;
      case '/two':
        view = TwoView();
        break;
      case '/tree':
        view = TreeView();
        break;
      case '/detalhes':
        var dados = settings.arguments as Map<String, dynamic>;
        view = DetalhesView(
          idProduto: dados['idProduto'],
          urlFoto: dados['urlFoto'],
        );
        break;
      default:
        return null;
    }

    return MaterialPageRoute(builder: (_) => view);
  }
}
