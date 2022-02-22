import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String title;

  CustomTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
