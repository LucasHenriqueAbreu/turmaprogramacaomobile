import 'package:flutter/material.dart';

class OneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One'),
      ),
      body: const Center(
        child: Text('Tela One'),
      ),
    );
  }
}
