import 'package:flutter/material.dart';
import 'package:projetox/src/home/home_view.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Informe o e-mail para login',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email é obrigatório, seu apedeuta!';
                  }
                  if (!value.contains('@')) {
                    return 'Email precisa de @, seu apedeuta!';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  hintText: 'Informe sua senha para login',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha é obrigatória, seu apedeuta!';
                  }
                  return null;
                },
                onSaved: (value) {
                  senha = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _login(context);
                },
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    var isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (email == 'teste@teste' && senha == '123123') {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Errou')));
      }
    }
  }
}
