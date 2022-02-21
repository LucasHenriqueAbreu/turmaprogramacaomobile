import 'package:flutter/material.dart';

class Home extends StatefullWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App olá mundo'),
      ),
      body: Center(child: Text('Você clicou $_count vezes')),
      floatActionButton: FloatActionButton(
        onPressed: () {
          setState() {
            _count++;
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
