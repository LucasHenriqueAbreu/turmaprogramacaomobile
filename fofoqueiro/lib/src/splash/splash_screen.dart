import 'package:flutter/material.dart';
import 'package:fofoqueiro/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AuthService>(builder: (context, authService, _) {
          if (authService.carregando) {
            return const CircularProgressIndicator();
          }
          if (authService.usuarioLogado) {
            _esperarParaRedirecionar('/home');
            return const Text('Usuário logado');
          }
          _esperarParaRedirecionar('/login');
          return const Text('Usuário não está logado');
        }),
      ),
    );
  }

  Future<void> _esperarParaRedirecionar(String rota) async {
    await Future.delayed(const Duration(seconds: 1));
    _redirecionaParaRota(rota);
  }

  void _redirecionaParaRota(String rota) {
    Navigator.pushReplacementNamed(context, rota);
  }
}
