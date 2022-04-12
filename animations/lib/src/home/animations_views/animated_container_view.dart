import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerView extends StatefulWidget {
  const AnimatedContainerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<AnimatedContainerView> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;
  double _borderTopLeft = 10;
  double _borderTopRight = 10;
  double _borderBottomLeft = 10;
  double _borderBottomRight = 10;

  double _progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          // https://api.flutter.dev/flutter/animation/Curves-class.html
          curve: Curves.linear,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_borderTopLeft),
              topRight: Radius.circular(_borderTopRight),
              bottomLeft: Radius.circular(_borderBottomLeft),
              bottomRight: Radius.circular(_borderBottomRight),
            ),
          ),
          child: Text('Altura: ${_height.round()}, Largura: ${_width.round()}'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: _animar,
          child: const Text('Animar'),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 20,
          width: _progress,
          color: Colors.blue,
        ),
      ],
    );
  }

  void _animar() {
    setState(() {
      _width = Random().nextDouble() * 400;
      _height = Random().nextDouble() * 400;

      var red = Random().nextInt(255);
      var green = Random().nextInt(255);
      var blue = Random().nextInt(255);
      var opacity = Random().nextDouble();
      _color = Color.fromRGBO(red, green, blue, opacity);

      _borderTopLeft = Random().nextDouble() * 200;
      _borderTopRight = Random().nextDouble() * 200;
      _borderBottomLeft = Random().nextDouble() * 200;
      _borderBottomRight = Random().nextDouble() * 200;

      _progress = MediaQuery.of(context).size.width;
    });
    _iniciarProgresso();
  }

  void _iniciarProgresso() {
    var value = MediaQuery.of(context).size.width / 10;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _progress += value;
      });
    });
  }
}
