import 'package:flutter/material.dart';
import 'package:olamundo/pages/home.dart';

class AppWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: 'App olá mundo',
      home: Home(),
    );
  }

  
}

