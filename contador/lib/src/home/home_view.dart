import 'package:contador/src/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    print('Passou no build principal');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: bodyBuilderBiiill(),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget bodyBuilderBiiill() {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: controller.count,
        builder: (BuildContext context, value, Widget? child) {
          print('Passou no build do body');
          return Text('Você clicou $value vezes');
        },
      ),
    );
  }
}
