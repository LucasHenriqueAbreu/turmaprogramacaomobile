import 'package:flutter/material.dart';
import 'package:projetox/src/home/home_view.dart';
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
        '/':(context) => LoginView(),
        '/home': (context) => HomeView()
      },      
    );
  }
}
