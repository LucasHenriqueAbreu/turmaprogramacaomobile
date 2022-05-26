import 'package:flutter/material.dart';
import 'package:fofoqueiro/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Consumer<AuthService>(
        builder: (_, loginController, __) {
          return Center(
            child: Text(
              '${loginController.usuarioLogado}',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        },
      ),
    );
  }
}
