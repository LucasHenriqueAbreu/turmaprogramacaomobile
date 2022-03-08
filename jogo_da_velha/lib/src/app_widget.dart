import 'package:flutter/material.dart';
import 'package:jogo_da_velha/src/home/home_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeWidget(),
    );
  }
}
