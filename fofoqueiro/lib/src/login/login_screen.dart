import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 75, left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bem vindo',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateInputEmail,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _senha,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: _validateInputSenha,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Login');
                    },
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      print('object');
                    },
                    child: const Text(
                      'Ainda não possui uma conta? Cadastre-se agora.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateInputEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!value.contains('@')) {
      return 'Email inválido';
    }

    return null;
  }

  String? _validateInputSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 6) {
      return 'Senha é tão fraca quanto quem criou, seu apedeuta!!!';
    }

    return null;
  }
}
