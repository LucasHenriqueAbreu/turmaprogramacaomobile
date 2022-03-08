import 'package:flutter/material.dart';
import 'package:layoutsapp/src/home/home_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeWidget(),
    );
  }
}
