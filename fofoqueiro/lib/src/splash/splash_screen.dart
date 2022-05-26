import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fofoqueiro/firebase_options.dart';
import 'package:fofoqueiro/src/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    _inicializaFirebase();
    super.initState();
  }
  
  void _inicializaFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      // Verificar usuário logado.
      //direcionar para home.
      _redirecionaParaLogin();
    } catch (e) {
      print(e);
    }
  }

  void _redirecionaParaLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
