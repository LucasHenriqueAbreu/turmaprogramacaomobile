import 'package:animations/src/home/animations_views/animated_container_view.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animações em Flutter - (implicitly animated)'),
      ),
      body: ListView(
        children: const [
          AnimatedContainerView()
        ],
      ),
    );
  }
}
