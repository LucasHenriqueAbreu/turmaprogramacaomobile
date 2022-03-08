import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<List<int>> _matriz =
      List.generate(3, (_) => List.generate(3, (_) => 0));

  int _jogadorVez = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Expanded(child: _buildRow(0)),
            Expanded(child: _buildRow(1)),
            Expanded(child: _buildRow(2))
          ],
        ),
      ),
    );
  }

  Widget _buildRow(int line) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => {
              _setPosition(line, 0),
            },
            child: AnimatedContainer(
              margin: EdgeInsets.all(2),
              color: _getColor(line, 0),
              duration: Duration(seconds: 1),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => {
              _setPosition(line, 1),
            },
            child: AnimatedContainer(
              margin: EdgeInsets.all(2),
              color: _getColor(line, 1),
              duration: Duration(seconds: 1),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => {
              _setPosition(line, 2),
            },
            child: AnimatedContainer(
              margin: EdgeInsets.all(2),
              color: _getColor(line, 2),
              duration: Duration(seconds: 1),
            ),
          ),
        ),
      ],
    );
  }

  void _setPosition(int line, int column) {
    setState(() {
      _matriz[line][column] = _jogadorVez;
      changeJogador();
    });
  }

  void changeJogador() {
    _jogadorVez = _jogadorVez % 2 == 0 ? 1 : 2;
  }

  Color _getColor(int line, int column) {
    var pos = _matriz[line][column];
    if (pos == 0) {
      return Colors.amber;
    }
    if (pos == 1) {
      return Colors.blue;
    }

    return Colors.red;
  }
}
