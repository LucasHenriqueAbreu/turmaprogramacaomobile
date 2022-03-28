import 'package:flutter/material.dart';
import 'package:navigator20/src/cadastro/cadastro_page.dart';
import 'package:navigator20/src/home/home_page.dart';
import 'package:navigator20/src/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/cadastro': (_) => const CadastroPage(),
      },
    );
  }
}

