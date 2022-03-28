import 'package:flutter/material.dart';
import 'package:projetox/src/home/menu/menu_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Olá'),
      ),
    );
  }
}
