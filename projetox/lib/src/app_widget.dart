import 'package:flutter/material.dart';
import 'package:projetox/src/home/home_view.dart';
import 'package:projetox/src/home/one_view.dart';
import 'package:projetox/src/home/tree_view.dart';
import 'package:projetox/src/home/two_view.dart';
import 'package:projetox/src/login/login_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginView(),
        '/home': (_) => HomeView(),
        '/one': (_) => OneView(),
        '/two': (_) => TwoView(), 
        '/tree': (_) => TreeView(), 
      },
    );
  }
}
