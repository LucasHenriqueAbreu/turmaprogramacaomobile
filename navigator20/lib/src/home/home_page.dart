import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastro');
          },
          child: const Text('Iniciar cadastro'),
        ),
      ),
    );
  }
}
