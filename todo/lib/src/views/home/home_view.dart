import 'package:flutter/material.dart';
import 'package:todo/src/views/home/componentes/custom_title.dart';
import 'package:todo/src/views/home/componentes/item_lista.dart';
import 'package:todo/src/views/home/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitle(
          title: 'teste',
        ),
      ),
      body: ListView(
        children: buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.addTarefa('Teste aleatório');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> buildList() {
    return controller.tarefas.map((e) => ItemLista(descricao: e)).toList();
  }
}
