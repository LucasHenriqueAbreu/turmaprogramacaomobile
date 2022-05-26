import 'package:flutter/material.dart';
import 'package:fofoqueiro/src/login/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Consumer<LoginController>(
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
