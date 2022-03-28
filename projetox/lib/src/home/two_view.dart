import 'package:flutter/material.dart';

class TwoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two'),
      ),
      body: const Center(
        child: Text('Tela Two'),
      ),
    );
  }
}
